#ifndef AUTHENTIFICATOR_H
#define AUTHENTIFICATOR_H

#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QQmlEngine>
#include <QJSEngine>

#include "project.h"
#include "ticket.h"
#include "loginData.h"

class Authentificator : public QObject
{
    Q_OBJECT

public:

    static QObject *autentificationSingletonProvider(QQmlEngine*, QJSEngine*);
    static Authentificator* getInstance();

    Q_INVOKABLE void getToken(QString login, QString password);

    Q_INVOKABLE void requestTiketsData(int id);
                void requestProjectsData();

                QList<Project> getProjectsList();
                QList<Ticket> getTicketsList();
private:
    explicit Authentificator(QObject *parent = nullptr);
    virtual ~Authentificator();
private:
    QNetworkAccessManager *manager;
    QString token;

    QList<Project> projects;
    QList<Ticket> tickets;

    static Authentificator *instance;

signals:
    void tokenRecieveSuccess();
    void tokenRecieveFailture();

    void projectsDataRecieveSuccess();
    void projectsDataRecieveFailture();

    void ticketsDataRecieveSuccess();
    void ticketsDataRecieveFailture();
};



#endif // AUTHENTIFICATOR_H
