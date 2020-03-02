import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: labelId
        text: qsTr("You are on Page 2.  \nNote: if you press on the 'Navigate' button, you can't get back here, \n'Page 2' is a temporarily a dead button (but the rest all work and swipe to another page fixes it)")
        anchors.centerIn: parent
    }

    Button {
        anchors.top: labelId.bottom
        anchors.left: labelId.left
        text: "Navigate to Page 4"
        onClicked: {setTabPageIndex(3)}
    }
}
