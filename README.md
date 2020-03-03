# TabBarBroken
Platform: Windows, 64 bit, Qt 5.13.1

Demonstrates a 'dead' Qt TabButton TabBar (inactive? disabled?) upon SwipeView.setCurrentIndex()

If you are on Page 1 and one presses 'Navigate to Page 4'
Then one cannot get back to Page 1, via the TabButton-TabBar, 'PAGE 1'

The 'PAGE 1' TabButton (TabBar?) is temporarily 'dead'?
but other TabButtons all work and if one swipes over and back (to/from) another page, this fixes things!

see also:
https://doc.qt.io/qt-5/qml-qtquick-controls2-container.html#managing-the-current-index
