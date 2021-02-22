#ifndef TICKET_H
#define TICKET_H

#include <QObject>

class Ticket
{
public:
    Ticket(QString name, QString description, int priority, int id);

    QString getName() const;
    QString getDescription() const;
    int getPriority() const;
    int     getId() const;

private:
    QString name;
    QString description;
    int priority;
    int id;
};

#endif // TICKET_H
