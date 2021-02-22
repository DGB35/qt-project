#ifndef PROJECT_H
#define PROJECT_H

#include <QObject>

class Project
{
public:
    Project(QString name, QString icon, int id);

    QString getName() const;
    QString getIcon() const;
    int     getId() const;

private:
    QString name;
    QString icon;
    int id;
};

#endif // PROJECT_H
