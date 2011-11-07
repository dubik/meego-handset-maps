#include <QtGui/QApplication>
#include <QtDeclarative>
#ifdef __arm__
#include <applauncherd/MDeclarativeCache>
#endif


Q_DECL_EXPORT int main(int argc, char *argv[])
{
#ifdef __arm__
    QApplication *app = MDeclarativeCache::qApplication(argc, argv);
    app->setProperty("NoMStyle", true);
    QDeclarativeView *view = MDeclarativeCache::qDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));
    view->showFullScreen();
    QObject::connect(view->engine(), SIGNAL(quit()), view, SLOT(close()));

    return app->exec();
#else
    QApplication app(argc, argv);
    app.setProperty("NoMStyle", true);
    QDeclarativeView *view = new QDeclarativeView();
    view->setSource(QUrl("qrc:/qml/main.qml"));
    view->show();
    QObject::connect(view->engine(), SIGNAL(quit()), view, SLOT(close()));

    return app.exec();
#endif

}
