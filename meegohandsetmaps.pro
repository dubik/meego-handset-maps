CONFIG += mobility
CONFIG += qdeclarative-boostable qt-boostable
INCLUDEPATH += /usr/include/applauncherd
LIBS += -lmdeclarativecache
MOBILITY += location
QT+= declarative
TEMPLATE = app
TARGET = meego-handset-maps
DESTDIR = bin

include(src/src.pri)

include(deployment.pri)
qtcAddDeployment()

QMAKE_CXXFLAGS += -fPIC -fvisibility=hidden -fvisibility-inlines-hidden
QMAKE_LFLAGS += -pie -rdynamic
