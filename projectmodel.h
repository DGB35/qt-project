#ifndef PROJECTMODEL_H
#define PROJECTMODEL_H

#include <QObject>
#include <QAbstractListModel>

#include "project.h"

class ProjectModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum ProjectRoles {
        NameRole = Qt::UserRole + 1,
        IconRole,
        IdRole
    };

    QHash<int, QByteArray> roleNames() const override;

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;

public:
    ProjectModel(QObject *parent = nullptr);

private:
    QList<Project> projects;

public slots:
    void appendItems();
};

#endif // PROJECTMODEL_H
