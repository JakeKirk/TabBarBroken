import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: labelId
        text: qsTr("You are on Page 1.\n\n" +
                   "Note: if one presses 'Navigate to Page 4',\n" +
                   "  then one cannot get back here via the TabButton-TabBar, 'PAGE 1'\n\n" +
                   "The 'PAGE 1' TabButton (TabBar?) is temporarily 'dead'?\n" +
                   "(but other TabButtons all work and if one swipes over to another page and back, this fixes things!)")
        anchors.centerIn: parent
    }

    Button {
        anchors.top: labelId.bottom
        anchors.left: labelId.left
        text: "Navigate to Page 4"
        onClicked: {
            // jump to Page4Form "Page 4" at swipeView index 3:
            setTabPageIndex(3)
        }
    }
}
