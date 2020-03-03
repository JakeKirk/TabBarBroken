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
        // An "auxillary" Page, that one can only get to via pressing the Page "navigate" button (or by swiping).
        Page4Form {
            id: page4Id
        }

        onCurrentIndexChanged: {
            console.log("SwipeView onCurrentIndexChanged swipeView index: ", swipeView.currentIndex)
            console.log("SwipeView onCurrentIndexChanged tabBar index: ", tabBar.currentIndex)
        } 
    } // end swipeView

    // In this example, swipeView contains an additional page(s) not directly accessible via the TabBar buttons below.
    // Think of the TabBar as having "bookmarks" if you will, to navigate to the important "chapters" in our app.
    // Another analogy might be something like home/previous/next TabButtons loading in x number of Pages.
    //      but in that case you might do better with decrementCurrentIndex() & incrementCurrentIndex().
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        readonly property int max_tab_index: 2          // zero based, index for maximum number of tabs (3) in our design {0, 1, 2}.

        TabButton {
            text: qsTr("Page 1")
            onClicked: {
                console.debug("onClicked 'Page 1' swipeView index is: ", swipeView.currentIndex)
                console.debug("onClicked 'Page 1' tabBar    index is: ", tabBar.currentIndex)

                // work around: if tabBar index exceeds what actually exists, then explicitly reset:
                if (tabBar.currentIndex > tabBar.max_tab_index)
                    setTabPageIndex( 0 );                   // enum preferred, but this works.
            }
        }
        TabButton {
            text: qsTr("Page 2")
            onClicked: {
                console.debug("onClicked 'Page 2' swipeView index is: ", swipeView.currentIndex)
                console.debug("onClicked 'Page 2' tabBar    index is: ", tabBar.currentIndex)

                // work around: if tabBar index exceeds what actually exists, then explicitly reset:
                if (tabBar.currentIndex > tabBar.max_tab_index)
                    setTabPageIndex( 1 );
            }
        }
        TabButton {
            text: qsTr("Page 3")
            onClicked: {
                console.debug("onClicked 'Page 3' swipeView index is: ", swipeView.currentIndex)
                console.debug("onClicked 'Page 3' tabBar    index is: ", tabBar.currentIndex)

                // work around: if tabBar index exceeds what actually exists, then explicitly reset:
                if (tabBar.currentIndex > tabBar.max_tab_index)
                    setTabPageIndex( 2 );
            }
        }

        // note: auxiliary "Page 4" doesn't use or have a corresponding TabButton.

        Component.onCompleted: {
            console.debug("onCompleted swipeView index is: ", swipeView.currentIndex)
            console.debug("onCompleted tabBar    index is: ", tabBar.currentIndex)
            //no need: setTabPageIndex(0)
        }

        onCurrentIndexChanged: {
            console.log("TabBar onCurrentIndexChanged swipeView index: ", swipeView.currentIndex)
            console.log("TabBar onCurrentIndexChanged tabBar index: ", tabBar.currentIndex)
        }
    }

    // setTabPageIndex() allows us to get to other pages, without renaming/adding additional TabButtons or breaking binding:
    // see: https://doc.qt.io/qt-5/qml-qtquick-controls2-container.html#managing-the-current-index
    // Note: PageIndex should probably be an enum, but for simplicity, since we know total number of pages index from 0-3 (four pages),
    // then we know that the fourth page, Page4Form is at swipeView index 3.
    function setTabPageIndex( PageIndex )
    {
        console.debug("setTabPageIndex (before) SwipeView index is: ", swipeView.currentIndex)
        console.debug("setTabPageIndex (before) TabBar    index is: ", tabBar.currentIndex)

        console.debug("...navigating via setCurrentIndex()")

        // A synchronous onCurrentIndexChanged() will occur.
        // Only update the SwipeView's currentIndex as the TabBar will take care of itself via
        //      a previous cross binding of View-to-Tab & Tab-to-View's currentIndex.
        swipeView.setCurrentIndex(PageIndex)

        // post:
        // tabBar.CurrentIndex could be out-of-range or greater that tabBar.max_tab_index!
        console.debug("setTabPageIndex (after) SwipeView index is: ", swipeView.currentIndex)
        console.debug("setTabPageIndex (after) TabBar    index is: ", tabBar.currentIndex)
    }
}
