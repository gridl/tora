//***************************************************************************
/*
 * TOra - An Oracle Toolkit for DBA's and developers
 * Copyright (C) 2000-2001,2001 Underscore AB
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation;  only version 2 of
 * the License is valid for this program.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 *      As a special exception, you have permission to link this program
 *      with the Oracle Client libraries and distribute executables, as long
 *      as you follow the requirements of the GNU GPL in regard to all of the
 *      software in the executable aside from Oracle client libraries.
 *
 *      Specifically you are not permitted to link this program with the
 *      Qt/UNIX, Qt/Windows or Qt Non Commercial products of TrollTech.
 *      And you are not permitted to distribute binaries compiled against
 *      these libraries without written consent from Underscore AB. Observe
 *      that this does not disallow linking to the Qt Free Edition.
 *
 * All trademarks belong to their respective owners.
 *
 ****************************************************************************/

#include "utils.h"

#include "tochangeconnection.h"
#include "toconf.h"
#include "toconnection.h"
#include "tomain.h"
#include "toresultbar.h"
#include "toresultcombo.h"
#include "toresultlock.h"
#include "toresultlong.h"
#include "toresultstats.h"
#include "toresultview.h"
#include "tosession.h"
#include "tosgastatement.h"
#include "tosql.h"
#include "totool.h"
#include "towaitevents.h"

#ifdef TO_KDE
#  include <kmenubar.h>
#endif

#include <qcombobox.h>
#include <qlabel.h>
#include <qmenubar.h>
#include <qmessagebox.h>
#include <qpopupmenu.h>
#include <qsplitter.h>
#include <qtimer.h>
#include <qtoolbar.h>
#include <qtoolbutton.h>
#include <qworkspace.h>
#include <qworkspace.h>

#include "tosession.moc"

#include "icons/clock.xpm"
#include "icons/disconnect.xpm"
#include "icons/noclock.xpm"
#include "icons/refresh.xpm"
#include "icons/tosession.xpm"

class toSessionTool : public toTool {
protected:
  virtual char **pictureXPM(void)
  { return tosession_xpm; }
public:
  toSessionTool()
    : toTool(210,"Sessions")
  { }
  virtual const char *menuItem()
  { return "Sessions"; }
  virtual QWidget *toolWindow(QWidget *parent,toConnection &connection)
  {
    return new toSession(parent,connection);
  }
};

static toSessionTool SessionTool;

static toSQL SQLConnectInfo("toSession:ConnectInfo",
			    "select authentication_type,osuser,network_service_banner\n"
			    "  from v$session_connect_info where sid = :f1<char[101]>",
			    "Get connection info for a session");
static toSQL SQLLockedObject("toSession:LockedObject",
			     "select b.Object_Name \"Object Name\",\n"
			     "       b.Object_Type \"Type\",\n"
			     "       DECODE(a.locked_mode,0,'None',1,'Null',2,'Row-S',\n"
			     "                            3,'Row-X',4,'Share',5,'S/Row-X',\n"
			     "                            6,'Exclusive',a.Locked_Mode) \"Locked Mode\"\n"
			     "  from v$locked_object a,sys.all_objects b\n"
			     " where a.object_id = b.object_id\n"
			     "   and a.session_id = :f1<char[101]>",
			     "Display info about objects locked by this session");
static toSQL SQLOpenCursors("toSession:OpenCursor",
			    "select SQL_Text \"SQL\", Address||':'||Hash_Value \" Address\"\n"
			    "  from v$open_cursor where sid = :f1<char[101]>",
			    "Display open cursors of this session");
static toSQL SQLSessionWait(TO_SESSION_WAIT,
			    "select sysdate,\n"
			    "       cpu*10 \"CPU\",\n"
			    "       parallel*10 \"Parallel execution\",\n"
			    "       filewrite*10 \"DB File Write\",\n"
			    "       writecomplete*10 \"Write Complete\",\n"
			    "       fileread*10 \"DB File Read\",\n"
			    "       singleread*10 \"DB Single File Read\",\n"
			    "       control*10 \"Control File I/O\",\n"
			    "       direct*10 \"Direct I/O\",\n"
			    "       log*10 \"Log file\",\n"
			    "       net*10 \"SQL*Net\",\n"
			    "       (total-parallel-filewrite-writecomplete-fileread-singleread-control-direct-log-net)*10 \"Other\"\n"
			    "  from (select SUM(DECODE(SUBSTR(event,1,2),'PX',time_waited,0))-SUM(DECODE(event,'PX Idle Wait',time_waited,0)) parallel,\n"
			    "               SUM(DECODE(event,'db file parallel write',time_waited,'db file single write',time_waited,0)) filewrite,\n"
			    "               SUM(DECODE(event,'write complete waits',time_waited,NULL)) writecomplete,\n"
			    "               SUM(DECODE(event,'db file parallel read',time_waited,'db file sequential read',time_waited,0)) fileread,\n"
			    "               SUM(DECODE(event,'db file scattered read',time_waited,0)) singleread,\n"
			    "               SUM(DECODE(SUBSTR(event,1,12),'control file',time_waited,0)) control,\n"
			    "               SUM(DECODE(SUBSTR(event,1,11),'direct path',time_waited,0)) direct,\n"
			    "               SUM(DECODE(SUBSTR(event,1,3),'log',time_waited,0)) log,\n"
			    "               SUM(DECODE(SUBSTR(event,1,7),'SQL*Net',time_waited,0))-SUM(DECODE(event,'SQL*Net message from client',time_waited,0)) net,\n"
			    "		    SUM(DECODE(event,'PX Idle Wait',0,'SQL*Net message from client',0,time_waited)) total\n"
			    "          from v$session_event where sid in (select b.sid from v$session a,v$session b where a.sid = :f1<char[101]> and a.audsid = b.audsid)),\n"
			    "       (select value*10 cpu from v$sesstat a\n"
			    "         where statistic# = 12 and a.sid in (select b.sid from v$session a,v$session b where a.sid = :f1<char[101]> and a.audsid = b.audsid))",
			    "Used to generate chart for session wait time.");
static toSQL SQLSessionIO(TO_SESSION_IO,
			  "select sysdate,\n"
			  "       sum(block_gets) \"Block gets\",\n"
			  "       sum(consistent_gets) \"Consistent gets\",\n"
			  "       sum(physical_reads) \"Physical reads\",\n"
			  "       sum(block_changes) \"Block changes\",\n"
			  "       sum(consistent_changes) \"Consistent changes\"\n"
			  "  from v$sess_io where sid in (select b.sid from v$session a,v$session b where a.sid = :f1<char[101]> and a.audsid = b.audsid)",
			  "Display chart of session generated I/O");

static toSQL SQLAccessedObjects("toSession:AccessedObjects",
				"SELECT owner,\n"
				"       OBJECT,\n"
				"       TYPE FROM v$access\n"
				" WHERE sid=:f1<CHAR [101]>\n"
				" ORDER BY owner,\n"
				"	  OBJECT,\n"
				"	  TYPE",
				"Which objects are accessed by the current session");

static toSQL SQLSessions("toSession:ListSession",
			 "SELECT a.Sid \"-Id\",\n"
			 "       a.Serial# \"-Serial#\",\n"
			 "       a.SchemaName \"Schema\",\n"
			 "       a.Status \"Status\",\n"
			 "       a.Server \"Server\",\n"
			 "       a.OsUser \"Osuser\",\n"
			 "       a.Machine \"Machine\",\n"
			 "       a.Program \"Program\",\n"
			 "       a.Type \"Type\",\n"
			 "       a.Module \"Module\",\n"
			 "       a.Action \"Action\",\n"
			 "       a.Client_Info \"Client Info\",\n"
			 "       b.Block_Gets \"-Block Gets\",\n"
			 "       b.Consistent_Gets \"-Consistent Gets\",\n"
			 "       b.Physical_Reads \"-Physical Reads\",\n"
			 "       b.Block_Changes \"-Block Changes\",\n"
			 "       b.Consistent_Changes \"-Consistent Changes\",\n"
			 "       c.Value*10 \"-CPU (ms)\",\n"
			 "       a.last_call_et \"Last SQL\",\n"
			 "       a.Process \"-Process\",\n"
			 "       d.sql_text \"Current statement\",\n"
			 "       a.SQL_Address||':'||SQL_Hash_Value \" SQL Address\",\n"
			 "       a.Prev_SQL_Addr||':'||Prev_Hash_Value \" Prev SQl Address\"\n"
			 "  FROM v$session a,\n"
			 "       v$sess_io b,\n"
			 "       v$sesstat c,\n"
			 "       v$sql d\n"
			 " WHERE a.sid = b.sid(+)\n"
			 "   AND a.sid = c.sid(+) AND (c.statistic# = 12 OR c.statistic# IS NULL)\n"
			 "   AND a.sql_address = d.address(+) AND a.sql_hash_value = d.hash_value(+)\n"
			 "   AND (d.child_number = 0 OR d.child_number IS NULL)\n"
			 "%1 ORDER BY a.Sid",
			 "List sessions, must have same number of culumns and the first and last 2 must be "
			 "the same");

toSession::toSession(QWidget *main,toConnection &connection)
  : toToolWidget(SessionTool,"session.html",main,connection)
{
  QToolBar *toolbar=toAllocBar(this,"Session manager");

  new QToolButton(QPixmap((const char **)refresh_xpm),
		  "Update sessionlist",
		  "Update sessionlist",
		  this,SLOT(refresh(void)),
		  toolbar);
  toolbar->addSeparator();
  Select=new toResultCombo(toolbar);
  Select->setSelected("All");
  Select->additionalItem("All");
  Select->additionalItem("No background");
  Select->additionalItem("No system");
  Select->query(toSQL::sql(toSQL::TOSQL_USERLIST));

  connect(Select,SIGNAL(activated(int)),this,SLOT(refresh()));
  
  toolbar->addSeparator();
  new QToolButton(QPixmap((const char **)clock_xpm),
		  "Enable timed statistics",
		  "Enable timed statistics",
		  this,SLOT(enableStatistics(void)),
		  toolbar);
  new QToolButton(QPixmap((const char **)noclock_xpm),
		  "Disable timed statistics",
		  "Disable timed statistics",
		  this,SLOT(disableStatistics(void)),
		  toolbar);
  toolbar->addSeparator();
  new QToolButton(QPixmap((const char **)disconnect_xpm),
		  "Disconnect selected session",
		  "Disconnect selected session",
		  this,SLOT(disconnectSession(void)),
		  toolbar);
  toolbar->addSeparator();
  new QLabel("Refresh ",toolbar);
  connect(Refresh=toRefreshCreate(toolbar),SIGNAL(activated(const QString &)),this,SLOT(changeRefresh(const QString &)));

  toolbar->setStretchableWidget(new QLabel("",toolbar));
  new toChangeConnection(toolbar);

  QSplitter *splitter=new QSplitter(Vertical,this);
  Sessions=new toResultLong(false,false,toQuery::Background,splitter);
  Sessions->setReadAll(true);
  connect(Sessions,SIGNAL(done()),this,SLOT(done()));

  ResultTab=new QTabWidget(splitter);
  StatisticSplitter=new QSplitter(Horizontal,ResultTab);
  SessionStatistics=new toResultStats(false,0,StatisticSplitter);
  WaitBar=new toResultBar(StatisticSplitter);
  WaitBar->setSQL(SQLSessionWait);
  WaitBar->setTitle("Session wait states");
  WaitBar->setYPostfix("ms/s");
  IOBar=new toResultBar(StatisticSplitter);
  IOBar->setSQL(SQLSessionIO);
  IOBar->setTitle("Session I/O");
  IOBar->setYPostfix("blocks/s");
  ResultTab->addTab(StatisticSplitter,"Statistics");

  Waits=new toWaitEvents(0,ResultTab,"waits");
  ResultTab->addTab(Waits,"Wait events");

  ConnectInfo=new toResultLong(true,false,toQuery::Background,ResultTab);
  ConnectInfo->setSQL(SQLConnectInfo);
  ResultTab->addTab(ConnectInfo,"Connect Info");
  PendingLocks=new toResultLock(ResultTab);
  ResultTab->addTab(PendingLocks,"Pending Locks");
  LockedObjects=new toResultLong(false,false,toQuery::Background,ResultTab);
  ResultTab->addTab(LockedObjects,"Locked Objects");
  LockedObjects->setSQL(SQLLockedObject);
  CurrentStatement=new toSGAStatement(ResultTab);
  ResultTab->addTab(CurrentStatement,"Current Statement");
  AccessedObjects=new toResultLong(false,false,toQuery::Background,ResultTab);
  AccessedObjects->setSQL(SQLAccessedObjects);
  ResultTab->addTab(AccessedObjects,"Accessing");

  PreviousStatement=new toSGAStatement(ResultTab);
  ResultTab->addTab(PreviousStatement,"Previous Statement");

  OpenSplitter=new QSplitter(Horizontal,ResultTab);
  ResultTab->addTab(OpenSplitter,"Open Cursors");
  OpenCursors=new toResultLong(false,true,toQuery::Background,OpenSplitter);
  OpenCursors->setSQL(SQLOpenCursors);
  OpenStatement=new toSGAStatement(OpenSplitter);

  Sessions->setSelectionMode(QListView::Single);
  OpenCursors->setSelectionMode(QListView::Single);
  connect(Sessions,SIGNAL(selectionChanged(QListViewItem *)),
	  this,SLOT(changeItem(QListViewItem *)));
  connect(OpenCursors,SIGNAL(selectionChanged(QListViewItem *)),
	  this,SLOT(changeCursor(QListViewItem *)));
  connect(ResultTab,SIGNAL(currentChanged(QWidget *)),
	  this,SLOT(changeTab(QWidget *)));

  try {
    connect(timer(),SIGNAL(timeout(void)),this,SLOT(refreshTabs(void)));
    toRefreshParse(timer());
  } TOCATCH
  CurrentTab=StatisticSplitter;

  ToolMenu=NULL;
  connect(toMainWidget()->workspace(),SIGNAL(windowActivated(QWidget *)),
	  this,SLOT(windowActivated(QWidget *)));
  refresh();

  setFocusProxy(Sessions);
}

void toSession::windowActivated(QWidget *widget)
{
  if (widget==this) {
    if (!ToolMenu) {
      ToolMenu=new QPopupMenu(this);
      ToolMenu->insertItem(QPixmap((const char **)refresh_xpm),"&Refresh",
			   this,SLOT(refresh(void)),Key_F5);
      ToolMenu->insertSeparator();
      ToolMenu->insertItem(QPixmap((const char **)clock_xpm),"Enable timed statistics",
			   this,SLOT(enableStatistics(void)));
      ToolMenu->insertItem(QPixmap((const char **)noclock_xpm),"Disable timed statistics",
			   this,SLOT(disableStatistics(void)));
      ToolMenu->insertSeparator();
      ToolMenu->insertItem(QPixmap((const char **)disconnect_xpm),"Disconnect session",
			   this,SLOT(disconnectSession(void)));
      ToolMenu->insertSeparator();
      ToolMenu->insertItem("&Change Refresh",Refresh,SLOT(setFocus(void)),
			   Key_R+ALT);
      toMainWidget()->menuBar()->insertItem("&Session",ToolMenu,-1,toToolMenuIndex());
    }
  } else {
    delete ToolMenu;
    ToolMenu=NULL;
  }
}

void toSession::refresh(void)
{
  try {
    QListViewItem *item=Sessions->selectedItem();
    if (item) {
      Session=item->text(0);
      Serial=item->text(1);
    } else
      Session=Serial=QString::null;
    QString sql=toSQL::string(SQLSessions,connection());
    QString extra;
    if (Select->currentItem()==0)
      ; // Do nothing
    else if (Select->currentItem()==1)
      extra="   AND a.Type != 'BACKGROUND'\n";
    else if (Select->currentItem()==2)
      extra="   AND a.SchemaName NOT IN ('SYS','SYSTEM')\n";
    else
      extra="   AND a.SchemaName = '"+Select->currentText()+"'\n";
    Sessions->setSQL(sql.arg(extra));
    Sessions->refresh();
  } TOCATCH
}

void toSession::done(void)
{
  for (QListViewItem *item=Sessions->firstChild();item;item=item->nextSibling())
    if (item->text(0)==Session&&
	item->text(1)==Serial) {
      Sessions->setSelected(item,true);
      break;
    }
}

void toSession::enableStatistics(bool enable)
{
  QString sql;
  if (enable)
    sql="ALTER SYSTEM SET TIMED_STATISTICS = TRUE";
  else
    sql="ALTER SYSTEM SET TIMED_STATISTICS = FALSE";
  try {
    connection().execute(sql);
  } catch (...) {
    toStatusMessage("No access to timed statistics flags");
  }
}

void toSession::changeTab(QWidget *tab)
{
  if (tab!=CurrentTab) {
    CurrentTab=tab;
    QListViewItem *item=Sessions->selectedItem();
    if (item) {
      if (CurrentTab==StatisticSplitter) {
	int ses=item->text(0).toInt();
	try {
	  SessionStatistics->changeSession(ses);
	} TOCATCH
      } else if (CurrentTab==ConnectInfo)
	ConnectInfo->changeParams(item->text(0));
      else if (CurrentTab==PendingLocks)
	PendingLocks->query(item->text(0));
      else if (CurrentTab==OpenSplitter) {
	QListViewItem *openitem=OpenCursors->currentItem();
	QString address;
	if (openitem)
	  address=openitem->text(2);
	OpenCursors->changeParams(item->text(0));
	if (!address.isEmpty())
	  for (openitem=OpenCursors->firstChild();
	       openitem;openitem=openitem->nextSibling())
	    if (address==openitem->text(2)) {
	      OpenCursors->setSelected(item,true);
	      break;
	    }
      } else if (CurrentTab==CurrentStatement)
	CurrentStatement->changeAddress(item->text(Sessions->columns()+0));
      else if (CurrentTab==AccessedObjects)
        AccessedObjects->changeParams(item->text(0));
      else if (CurrentTab==LockedObjects)
	LockedObjects->changeParams(item->text(0));
      else if (CurrentTab==PreviousStatement)
	PreviousStatement->changeAddress(item->text(Sessions->columns()+1));
    }
  }
}

void toSession::changeCursor(QListViewItem *item)
{
  if (item)
    OpenStatement->changeAddress(item->text(2));
}

void toSession::disconnectSession(void)
{
  QListViewItem *item=Sessions->selectedItem();
  if (item) {
    QString sess="'";
    sess.append(item->text(0));
    sess.append(",");
    sess.append(item->text(1));
    sess.append("'");
    QString str("Let current transaction finish before disconnecting session?");
    QString sql;
    switch(TOMessageBox::warning(this,"Commit work?",str,"&Yes","&No","&Cancel")) {
    case 0:
      sql="ALTER SYSTEM DISCONNECT SESSION ";
      sql.append(sess);
      sql.append(" POST_TRANSACTION");
      break;
    case 1:
      sql="ALTER SYSTEM KILL SESSION ";
      sql.append(sess);
      break;
    case 2:
      return;
    }
    try {
      connection().execute(sql);
    } TOCATCH
  }
}

void toSession::changeRefresh(const QString &str)
{
  try {
    toRefreshParse(timer(),str);
  } TOCATCH
}

void toSession::changeItem(QListViewItem *item)
{
  if (item&&LastSession!=item->text(0)) {
    if (!item->text(0).isEmpty()) {
      WaitBar->changeParams(item->text(0));
      IOBar->changeParams(item->text(0));
      Waits->setSession(item->text(0).toInt());
    }
    LastSession=item->text(0);
  }
  QWidget *t=CurrentTab;
  CurrentTab=NULL;
  changeTab(t);
}

void toSession::refreshTabs(void)
{
  QListViewItem *item=Sessions->selectedItem();
  if (item)
    changeItem(item);
}
