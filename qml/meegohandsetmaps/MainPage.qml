import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Rectangle {
        id: r
        width: 200
        height: 200
        color: "blue"
    }

    PinchArea {
        anchors.fill: parent
        focus: true
        pinch.target: r
        pinch.minimumScale: 1.0
        pinch.maximumScale: 2.0
        onPinchStarted: console.log("Started")
    }
}
