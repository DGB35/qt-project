#include "ticketmodel.h"
#include "authentificator.h"

TicketModel::TicketModel(QObject *parent): QAbstractListModel(parent)
{
    QObject::connect(Authentificator::getInstance(), SIGNAL(ticketsDataRecieveSuccess()), this, SLOT(appendItems()));
}

void TicketModel::appendItems()
{
    beginResetModel();

    tickets.clear();
    for(int i = 0; i < Authentificator::getInstance()->getTicketsList().count(); ++i)
        tickets.append(Authentificator::getInstance()->getTicketsList()[i]);

    endResetModel();
}

QHash<int, QByteArray> TicketModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[DescriptionRole] = "description";
    roles[PriorityRole] = "priority";
    roles[IdRole] = "id";
    return roles;
}

int TicketModel::rowCount(const QModelIndex &parent) const
{
    return tickets.count();
}

QVariant TicketModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
           return QVariant();

    switch (role) {
    case TicketRoles::NameRole:
        return tickets[index.row()].getName();
        break;

    case TicketRoles::DescriptionRole:
        return tickets[index.row()].getDescription();
        break;

    case TicketRoles::PriorityRole:
        return tickets[index.row()].getPriority();
        break;

    case TicketRoles::IdRole:
        return tickets[index.row()].getId();
        break;

    default:
        return QVariant();
        break;
    }
}
