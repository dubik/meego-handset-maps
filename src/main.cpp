#include <QtGui/QApplication>
#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView *view = new QDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));
    view->show();

    return app.exec();
}
