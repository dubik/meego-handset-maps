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
            iconSource: "qrc:/data/icon-m-current-position.svg"
        }

        ToolIcon {
            iconSource: "qrc:/data/icon-m-zoom-out.svg"
            onClicked: {
                map.zoomLevel -= 1
            }
        }

        ToolIcon {
            iconSource: "qrc:/data/icon-m-zoom-in.svg"
            onClicked: {
                map.zoomLevel += 1
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
        center: Coordinate { latitude: 60.169589; longitude: 24.941318} //TODO - cache last position?

        PositionSource {
            id: positionSource
            updateInterval: 1000
            active: true
            onPositionChanged: map.center = positionSource.position.coordinate;
            //TODO - we need code to handle accuracy and situations withouth GPS
        }

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
