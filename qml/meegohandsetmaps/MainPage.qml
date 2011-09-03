import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.location 1.2

Page {
    tools: commonTools

    ToolBarLayout {
        id: commonTools
        visible: true

        ToolIcon {
            id: currentLocation
            platformIconId: "icon-m-toolbar-refresh3"
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-previous"
            onClicked: {
                map.zoomLevel += 1
            }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-next"
            onClicked: {
                map.zoomLevel -= 1
            }
        }

    }


    Map {
        id: map
        plugin : Plugin {name : "nokia"}
        anchors.fill: parent
        size.width: parent.width
        size.height: parent.height
        zoomLevel: 10

        MapMouseArea {
            id: mouseArea
            property int lastX : -1
            property int lastY : -1

            onPressed : {
                lastX = mouse.x
                lastY = mouse.y
            }
            onReleased : {
                lastX = -1
                lastY = -1
            }

            onPositionChanged: {
                if (mouse.button == Qt.LeftButton) {
                    if ((lastX != -1) && (lastY != -1)) {
                        var dx = mouse.x - lastX
                        var dy = mouse.y - lastY
                        map.pan(-dx, -dy)
                    }
                    lastX = mouse.x
                    lastY = mouse.y
                }
            }

            onDoubleClicked: {
                map.center = mouse.coordinate
                map.zoomLevel += 1
                lastX = -1
                lastY = -1
            }
        }
    }
}
