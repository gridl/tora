//***************************************************************************
/* $Id$
**
** Copyright (C) 2000-2001 GlobeCom AB.  All rights reserved.
**
** This file is part of the Toolkit for Oracle.
**
** This file may be distributed under the terms of the Q Public License
** as defined by Trolltech AS of Norway and appearing in the file
** LICENSE included in the packaging of this file.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
** See http://www.globecom.net/tora/ for more information.
**
** Contact tora@globecom.se if any conditions of this licensing are
** not clear to you.
**
**********************************************************************/

#ifndef __TOPIECHART_H
#define __TOPIECHART_H

#include <list>
#include <qwidget.h>

/** A widget that displays a piechart.
 */

class toPieChart : public QWidget {
  Q_OBJECT

  std::list<double> Values;
  std::list<QString> Labels;
  QString Postfix;
  bool Legend;
  bool DisplayPercent;
  QString Title;
public:
  /** Create a new piechart.
   * @param parent Parent widget.
   * @param name Name of widget.
   * @param f Widget flags.
   */
  toPieChart(QWidget *parent=NULL,const char *name=NULL,WFlags f=0);

  /** Set the postfix text to append the current values when they are displayed in the
   * pie.
   * @param post Postfix string, no space will be added after the value before the string
   *             so if you want the space you need to specify it first in this string.
   */
  void setPostfix(const QString &post)
  { Postfix=post; update(); }
  /** Get the postfix string.
   * @return Current postfix string.
   */
  const QString &postfix(void) const
  { return Postfix; }

  /** Set title of the chart. Set to empty string to not display title.
   * @param title Title of chart.
   */
  void setTitle(const QString &title=QString::null)
  { Title=title; update(); }
  /** Get title of chart.
   * @return Title of chart.
   */
  const QString &title(void)
  { return Title; }

  /** Display piecharts in percent instead of actual values
   * @param pct Wether or not to display percent only.
   */
  void setDisplayPercent(bool pct)
  { DisplayPercent=pct; update(); }
  /** Check if only percent is displayed
   * @return True if only percent is displayed.
   */
  bool displayPercent(void) const
  { return DisplayPercent; }

  /** Specify if legend should be displayed to the right of the graph, default is on.
   * @param on Whether to display graph or not.
   */
  void showLegend(bool on)
  { Legend=on; update(); }
  /** Check if legend is displayed or not.
   * @return If legend is displayed or not.
   */
  bool legend(void) const
  { return Legend; }

  /** Set value list of piechart.
   * @param values List of values to display.
   * @param labels List of labels, if label is empty it will not appear in legend.
   */
  void setValues(std::list<double> &values,std::list<QString> &labels)
  { Values=values; Labels=labels; update(); }
  /** Add a value to the piechart.
   * @param value New value to add.
   * @param label Label of this new value.
   */
  void addValue(double value,const QString &label)
  { Values.insert(Values.end(),value); Labels.insert(Labels.end(),label); update(); }
  /** Get list of values.
   * @return Values in piechart.
   */
  std::list<double> &values(void)
  { return Values; }
  /** Get labels of piechart.
   * @return List of labels.
   */
  std::list<QString> &labels(void)
  { return Labels; }

protected:
  /** Reimplemented for internal reasons.
   */
  virtual void paintEvent(QPaintEvent *e);
};

#endif
