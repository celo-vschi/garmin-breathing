using Toybox.Application;
using Toybox.WatchUi;

class BreathingApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	view = new BreathingView();
    	
    	var delegate = new BreathingDelegate(view);
        return [ view,  delegate];
    }

}
