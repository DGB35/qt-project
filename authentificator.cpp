#include "authentificator.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkReply>
#include <QJsonArray>
#include <QJsonValue>

Authentificator* Authentificator::instance = nullptr;

Authentificator::Authentificator(QObject *parent) : QObject(parent),
    manager{ new QNetworkAccessManager(this) },
    token { }
{
}

Authentificator::~Authentificator()
{
    delete manager;
    delete instance;
}

QObject* Authentificator::autentificationSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return getInstance();
}

Authentificator *Authentificator::getInstance()
{
    if(instance == nullptr)
        instance = new Authentificator();
    return instance;
}

void Authentificator::requestProjectsData()
{
    const QUrl url(dataRequestLink);
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader(rawHeaderKey.toUtf8(), token.toUtf8());

    QNetworkReply *reply = manager->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError) {
            QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
            QJsonObject jsonObject = jsonResponse.object();

            QJsonArray jsonArray = jsonObject["projects"].toArray();

            if(!projects.isEmpty())
                projects.clear();

            //Parsing JSON to QList<Project>
            foreach (const QJsonValue & value, jsonArray) {
                QJsonObject obj = value.toObject();
                Project project(obj["name"].toString(), obj["icon"].toString(), obj["id"].toInt());
                projects.append(project);
            }
            emit projectsDataRecieveSuccess();
        }
        else {
            QString err = reply->errorString();
            emit projectsDataRecieveFailture();
        }
        reply->deleteLater();
    });
}

void Authentificator::requestTiketsData(int id)
{
    const QUrl url((ticketRequestLink + QString::number(id) + "/"));
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader(rawHeaderKey.toUtf8(), token.toUtf8());

    QNetworkReply *reply = manager->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError) {
            QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
            QJsonObject jsonObject = jsonResponse.object();
            QJsonArray jsonArray = jsonObject["tickets"].toArray();

            if(!tickets.isEmpty())
                tickets.clear();

            //Parsing JSON to QList<Ticket>
            foreach (const QJsonValue & value, jsonArray) {
                QJsonObject obj = value.toObject();
                Ticket ticket(obj["name"].toString(), obj["description"].toString(), obj["priority"].toInt(), obj["id"].toInt());
                tickets.append(ticket);

            }

            emit ticketsDataRecieveSuccess();
        }
        else {
            QString err = reply->errorString();
            emit ticketsDataRecieveFailture();
        }
        reply->deleteLater();
    });
}


QList<Project> Authentificator::getProjectsList()
{
    return projects;
}

QList<Ticket> Authentificator::getTicketsList()
{
    return tickets;
}

void Authentificator::getToken(QString login, QString password)
{
    const QUrl url(tokenRequestLink);

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject obj;
    obj["login"] = login;
    obj["password"] = password;
    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    QNetworkReply *reply = manager->post(request, data);
    reply->ignoreSslErrors();

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError){
            auto json = QJsonDocument::fromJson(reply->readAll());
            token = json["token"].toString();
            requestProjectsData();
            emit tokenRecieveSuccess();
        }
        else{
            QString err = reply->errorString();
            qDebug() << err;
            emit tokenRecieveFailture();
        }
        reply->deleteLater();
    });
}
