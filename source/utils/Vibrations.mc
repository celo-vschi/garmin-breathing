using Toybox.System;
using Toybox.Timer;
using Toybox.Attention;

class Vibrations {
	
	private var mCounter;
	private var mTimer;
	
	private var mTimerWait;
	private var mVibrationDuration;
	private var mVibrationDurations;
	private var mIntensities;
	
	function initialize() {
//		System.println("fmm");
//		finish();
//		pause();
//		work();
//		rest();
	}
	
	function finish() {
		resetAll();
		mCounter = 1;
		mTimerWait = 0;
		mVibrationDuration = 1000;	
		startTimer();
	}
	
	function pause() {
		resetAll();
		mCounter = 1;
		mTimerWait = 0;
		mVibrationDuration = 50;	
		startTimer();
	}
	
	function work() {
		resetAll();
		mCounter = 5;
		mTimerWait = 100;
		mIntensities = [100, 90, 80, 70, 60];
		mVibrationDuration = 100;
		startTimer();
	}
	
	function rest() {
		resetAll();
		mCounter = 5;
		mTimerWait = 100;
		mIntensities = [60, 70, 80, 90, 100];
		mVibrationDuration = 100;
		startTimer();
	}
	
	function startTimer() {
		if (mCounter == 1 && mTimerWait == 0) {
			callback();		
		} else {
			mTimer = new Timer.Timer();
			mTimer.start(method(:callback), mTimerWait, true);
		}
	}
	
	function callback() {
		if (mCounter > 0) {
			if (mIntensities == null && mVibrationDurations == null) {
//				System.println("case 1");
				Attention.vibrate([
					new Attention.VibeProfile(100, mVibrationDuration)
				]);
			} else if (mIntensities == null && mVibrationDurations != null) {
//				System.println("case 2");
				Attention.vibrate([
					new Attention.VibeProfile(100, mVibrationDurations[mCounter-1])
				]);
			} else if (mIntensities != null && mVibrationDurations == null) {
//				System.println("case 3");
				Attention.vibrate([
					new Attention.VibeProfile(mIntensities[mCounter-1], mVibrationDuration)
				]);
			} else {
//				System.println("case 4");
				Attention.vibrate([
					new Attention.VibeProfile(mIntensities[mCounter-1], mVibrationDurations[mCounter-1])
				]);
			}
			mCounter--;
		} else {
			if (mTimer != null) {
				mTimer.stop();
			}
		}
	}
	
	private function resetAll() {
		mCounter = 0;
		mTimer = null;
		
		mTimerWait = 0;
		mVibrationDuration = 0;
		mVibrationDurations = null;
		mIntensities = null;	
	}	
	
}