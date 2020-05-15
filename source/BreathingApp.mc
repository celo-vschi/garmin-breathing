using Toybox.Application;
using Toybox.WatchUi;

class BreathingApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
    	view = new BreathingView();
    	
    	var delegate = new BreathingDelegate(view);
        return [ view,  delegate];
    }

}
