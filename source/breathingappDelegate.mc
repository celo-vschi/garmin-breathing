using Toybox.WatchUi;

class breathingappDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new breathingappMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}