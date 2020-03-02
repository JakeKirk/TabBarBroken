import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Demonstrates a 'dead' TabButton/TabBar (inactive? disabled?) upon SwipeView.setCurrentIndex()")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        // index 0
        Page1Form {
            id: page1Id
        }

        // index 1
        Page2Form {
            id: page2Id
        }

        // index 2
        Page3Form {
            id: page3Id
        }

        // index 3
        // note: An this is an extra "auxillary" Page, that one can only get to via pressing the Page "navigate" button.
        Page4Form {
            id: page4Id
        }
    }

    // In this example, swipeView contains an additional page not directly accessible via the TabBar buttons below.
    // Think of the TabBar as having "bookmarks" if you will, to navigate to the important "chapters" in our app.
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }

        // note: auxlliary Page 4 doesn't use or have an corresponding TabButton.
    }

    // note: PageIndex should probably be an enum, but for simplicity, since we know total number of pages that index from 0-3 (four pages),
    // then we know that the fourth page, Page4Form is at swipeView index 3.
    function setTabPageIndex( PageIndex )
    {
        // this allows us to get to other pages, without renaming/adding additional TabButtons.
        swipeView.setCurrentIndex(PageIndex)

        console.debug("setTabPageIndex SwipeView index is: ", swipeView.currentIndex)
        console.debug("setTabPageIndex TabBar    index is: ", tabBar.currentIndex)
    }
}
