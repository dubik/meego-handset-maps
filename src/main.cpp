#include <QtGui/QApplication>
#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView *view = new QDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));
    view->show();
    QObject::connect(view.engine(), SIGNAL(quit()), &view, SLOT(close()));

    return app.exec();
}
