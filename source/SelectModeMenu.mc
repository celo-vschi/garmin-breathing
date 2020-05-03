using Toybox.WatchUi as Ui;
using Toybox.System;

class SelectModeMenu extends Ui.Menu {

	function initialize() {
		Menu.initialize();
		setTitle("Mode");
		
		addItem("Second Ticker", :sec);
		addItem("Box Breathing", :box);
	}
	
}
