import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400
    title: "Page 2"

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: labelId
        text: qsTr("You are on Page 2.\n\n" +
                   "Note: if one presses 'Navigate to Page 4',\n" +
                   "  then one cannot get back here via the TabButton-TabBar, 'PAGE 2'\n\n" +
                   "The 'PAGE 2' TabButton (TabBar?) is temporarily 'dead'?\n" +
                   "(but other TabButtons all work and if one swipes over to another page and back, this fixes things!)")
        anchors.centerIn: parent
    }

    Button {
        anchors.top: labelId.bottom
        anchors.left: labelId.left
        text: "Navigate to Page 4"
        onClicked: {setTabPageIndex(3)}
    }
}
