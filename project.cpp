#include "project.h"


Project::Project(QString _name, QString _icon, int _id):
    name{_name}, icon{_icon}, id{_id}
{
}

QString Project::getName() const
{
    return name;
}

QString Project::getIcon() const
{
    return icon;
}

int Project::getId() const
{
    return id;
}
