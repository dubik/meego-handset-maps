import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.location 1.2

Page {
    tools: commonTools
    property bool following : true
    property bool haveLocation: false

    ToolBarLayout {
        id: commonTools
        visible: true

        ToolIcon {
            id: currentLocation
            iconSource: "qrc:/data/icon-m-current-position.svg"
            onClicked: {
                if (haveLocation) {
                    following = true;
                    map.center = positionSource.position.coordinate;
                }
            }
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

        ToolIcon {
            id: menuButton
            iconId: "toolbar-view-menu"
            onClicked: (mapsMenu.status == DialogStatus.Closed) ? mapsMenu.open() : mapsMenu.close()
        }
    }

    Menu {
        id: mapsMenu
        MenuLayout {
            MenuItem { text: "Exit"; onClicked: Qt.quit() }
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
            onPositionChanged: {
                if (following) {
                    if (positionSource.position.latitudeValid) {
                        map.center = positionSource.position.coordinate;
                        haveLocation = true
                        print("Got location")
                    } else {
                        haveLocation = false
                        print("No location")
                        //TODO - set a dimmed current location icon
                    }
                }
            }
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
                    following = false
                }
            }

            onDoubleClicked: {
                map.center = mouse.coordinate
                map.zoomLevel += 1
                lastX = -1
                lastY = -1
                following = false
            }
        }
        Component.onCompleted:positionSource.start()
    }
}
