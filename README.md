# TabBarBroken
Platform: Windows, 64 bit, Qt 5.13.1 (and recent versions of Qt.)

An implementation for when the # of Pages exceeds the number of TabButtons in a SwipeView.

It was found that when using SwipeView.setCurrentIndex() that the TabBar.currentIndex could go out-of-range or more than the number of TabButtons created for the design.  This in turn seems to cause the TabButton to not pass on messages to the TabBar and to appear "dead" or inactive.  (but other TabButtons at indexes +/- work just fine... hmmm).

see also:
https://doc.qt.io/qt-5/qml-qtquick-controls2-container.html#managing-the-current-index
