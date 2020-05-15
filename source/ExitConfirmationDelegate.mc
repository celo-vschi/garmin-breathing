using Toybox.WatchUi as Ui;
using Toybox.System;

class ExitConfirmationDelegate extends Ui.ConfirmationDelegate {

		private var mView;

	    function initialize(view) {
	        ConfirmationDelegate.initialize();
	        mView = view;
	    }
	
	    function onResponse(response) {
	        if (response == Ui.CONFIRM_YES) {
				mView.closeActivity();
	        }
	    }
	    
}