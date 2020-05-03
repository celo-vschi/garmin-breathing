using Toybox.WatchUi;

class BreathingDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new SelectModeMenu(), new SelectModeDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}