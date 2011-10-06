#include <QtGui/QApplication>
#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setProperty("NoMStyle", true);
    QDeclarativeView *view = new QDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));

#ifdef __arm__
    window.showFullScreen();
#else
    view->show();
#endif

    QObject::connect(view->engine(), SIGNAL(quit()), view, SLOT(close()));

    return app.exec();
}
