#include "ticket.h"



Ticket::Ticket(QString _name, QString _description, int _priority, int _id):
    name {_name}, description {_description},
    priority {_priority}, id {_id}
{
}

QString Ticket::getName() const
{
    return name;
}

QString Ticket::getDescription() const
{
    return description;
}

int Ticket::getPriority() const
{
    return priority;
}

int Ticket::getId() const
{
    return id;
}
