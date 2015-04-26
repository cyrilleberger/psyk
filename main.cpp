#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

#include "Interface.h"
#include "modules/SmilingFaces/SmilingServer.h"
#include "ExternalResource.h"

int main(int argc, char *argv[])
{
  QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::DataLocation));

  qmlRegisterType<ExternalResource>("psyk", 1, 0, "ExternalResource");
  qmlRegisterType<SmilingServer>("modules.SmilingFaces", 1, 0, "SmilingServer");

  QApplication app(argc, argv);

  QQmlApplicationEngine engine;
  Interface interface;
  engine.rootContext()->setContextProperty("app_interface", &interface);
  engine.addImportPath("qrc:/qml");
  engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

  return app.exec();
}
