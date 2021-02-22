#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "authentificator.h"
#include "projectmodel.h"
#include "ticketmodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/imports");

    qmlRegisterSingletonType<Authentificator>("com.dgb.authentificator", 1, 0,
                                              "Authentificator", Authentificator::autentificationSingletonProvider);

    qmlRegisterType<ProjectModel>("com.dgb.projectModel", 1, 0, "ProjectModel");
    qmlRegisterType<TicketModel>("com.dgb.ticketModel", 1, 0, "TicketModel");

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
