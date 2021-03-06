
/* BEGIN_COMMON_COPYRIGHT_HEADER
 *
 * TOra - An Oracle Toolkit for DBA's and developers
 *
 * Shared/mixed copyright is held throughout files in this product
 *
 * Portions Copyright (C) 2000-2001 Underscore AB
 * Portions Copyright (C) 2003-2005 Quest Software, Inc.
 * Portions Copyright (C) 2004-2013 Numerous Other Contributors
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
 * along with this program as the file COPYING.txt; if not, please see
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
 *
 *      As a special exception, you have permission to link this program
 *      with the Oracle Client libraries and distribute executables, as long
 *      as you follow the requirements of the GNU GPL in regard to all of the
 *      software in the executable aside from Oracle client libraries.
 *
 * All trademarks belong to their respective owners.
 *
 * END_COMMON_COPYRIGHT_HEADER */

#ifndef TOSCRIPTTREEMODEL_H
#define TOSCRIPTTREEMODEL_H

#include <QtCore/QAbstractItemModel>

class QModelIndex;
class toScriptTreeItem;
class toConnectionOptions;


/*! \brief A tree model for QTreeView used in toScriptSchemaWidget.
Read Qt4 documenation to understand MVC used here.
*/
class toScriptTreeModel : public QAbstractItemModel
{
        Q_OBJECT

    public:
        toScriptTreeModel(QObject *parent = 0);
        ~toScriptTreeModel();

        QVariant data(const QModelIndex &index, int role) const;
        Qt::ItemFlags flags(const QModelIndex &index) const;
        QVariant headerData(int section, Qt::Orientation orientation,
                            int role = Qt::DisplayRole) const;
        QModelIndex index(int row, int column,
                          const QModelIndex &parent = QModelIndex()) const;
        QModelIndex parent(const QModelIndex &index) const;
        int rowCount(const QModelIndex &parent = QModelIndex()) const;
        int columnCount(const QModelIndex &parent = QModelIndex()) const;

        /*! \brief Reset the model with newly readed data from database.
        \param connId toConnectionOptions key indentifier for toConnectionRegistry
        \param schema it can be null. When it's given, the SQL statements
        will use WHERE clause with this string.
        */
        void setupModelData(const toConnectionOptions& connId, const QString & schema = 0);

    private:
        //! An universal root item. It's deleted and recreated in setupModelData()
        toScriptTreeItem *rootItem;
};

#endif
