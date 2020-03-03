import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400
    title: "Page 4"

    header: Label {
        text: qsTr("Auxillary Page 4")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You got here either via swipe or via pressing the 'Page 1' or 'Page 2'\n"+
                   " 'Navigate to Page 4' button.\n\n" +
                   "*If you got here via 'Navigate to Page 4',\n"+
                   " then the TabButton/TabBar is now broken/unresponsive.")
        anchors.centerIn: parent
    }
}
