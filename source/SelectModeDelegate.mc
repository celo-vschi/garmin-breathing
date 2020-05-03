using Toybox.WatchUi;
using Toybox.System;

class SelectModeDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :sec) {
            System.println("sec");
        } else if (item == :box) {
            System.println("box");
        }
    }

}