import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Auxillary Page 4")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on the Auxillary Page 4.\nYou got here via swipe or Page 1 or Page 2 button press on 'Navigate to Page 4''")
        anchors.centerIn: parent
    }
}
