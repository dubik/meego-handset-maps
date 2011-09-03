import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true

        ToolIcon {
            id: currentLocation
            platformIconId: "icon-m-toolbar-refresh3"
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-previous"
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-next"
        }

    }

}
