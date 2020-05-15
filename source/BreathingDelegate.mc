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

			if (mView.getCounter() < 6) {
				openConfirmationDelegate();
			} else {
				mView.closeActivity();
			}
			
			return true;
    	}
    	return false;
    }

	function onKey(keyEvent) {
    	var key = keyEvent.getKey();
		
		if (key == WatchUi.KEY_ENTER) {
    		if (!mView.isRunning()) {
				mView.startActivity();
    		} else {
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
    
    function openConfirmationDelegate() {
    	var dialog = new WatchUi.Confirmation("Wanna exit?");
    	WatchUi.pushView(
			dialog,
			new ExitConfirmationDelegate(mView),
			WatchUi.SLIDE_IMMEDIATE
		);
    }

}