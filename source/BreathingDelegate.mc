using Toybox.WatchUi;
using Toybox.System;

class BreathingDelegate extends WatchUi.BehaviorDelegate {

	private var mView = null;

    function initialize(view) {
        BehaviorDelegate.initialize();
        mView = view;
    }
    
    function onBack() {
    	if (mView == null) {
    		return false;
    	} else if (mView.isRunning()) {
			mView.stopActivity();
			return true;
    	}
    	return false;
    }

	function onKey(keyEvent) {
    	var key = keyEvent.getKey();
		
		if (key == WatchUi.KEY_ENTER) {
    		if (!mView.isRunning()) {
				mView.startActivity();
    		}
    		return true;
		
		} else if (key == WatchUi.KEY_UP) {
			if (mView.isRunning()) {
				mView.increaseCounter();
			}
			return true;
		}
		
		
    	return false;
	}
    
    function onMenu() {
    	if (!mView.isRunning()) {
   			WatchUi.pushView(new SelectModeMenu(), new SelectModeDelegate(), WatchUi.SLIDE_UP);
    	} 
        return true;
    }

}