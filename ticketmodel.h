#ifndef TICKETMODEL_H
#define TICKETMODEL_H

#include <QObject>
#include <QAbstractListModel>

#include "ticket.h"

class TicketModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum TicketRoles {
        NameRole = Qt::UserRole + 1,
        DescriptionRole,
        PriorityRole,
        IdRole
    };

    QHash<int, QByteArray> roleNames() const override;

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;

public:
    TicketModel(QObject *parent = nullptr);

private:
    QList<Ticket> tickets;

public slots:
    void appendItems();
};

#endif // TICKETMODEL_H
