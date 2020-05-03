using Toybox.Lang;

module Utils {

	function formatTimerLabelClock(seconds) {
		var min = seconds / 60;
		var sec = seconds - 60 * min;
		
		min = addLeadingZero(min);
		sec = addLeadingZero(sec);
		
		
		return min + ":" + sec;
	}
	
	function addLeadingZero(number) {
		var result;
		
		if (number < 10) {
			result = "0" + number;
		} else {
			result = number.toString();
		}
		
		return result;
	}
	
}