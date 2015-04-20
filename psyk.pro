TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp Interface.cpp modules/SmilingFaces/SmilingInfo.cpp modules/SmilingFaces/SmilingServer.cpp
HEADERS += Interface.h modules/SmilingFaces/SmilingInfo.h modules/SmilingFaces/SmilingServer.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
