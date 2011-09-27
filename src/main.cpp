#include <QtGui/QApplication>
#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView *view = new QDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));
    view->show();

/*
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setWindowTitle("Maps");
    viewer.setMainQmlFile(QLatin1String("qml/meegohandsetmaps/main.qml"));
    viewer.showExpanded();
*/

    return app.exec();
}
