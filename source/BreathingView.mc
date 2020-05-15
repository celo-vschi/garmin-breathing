using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Timer;

class BreathingView extends WatchUi.View {
	
	// Drawable ids
	const DRAWABLE_TIMER = "TimerLabel";
	const DRAWABLE_INSTRUCTIONS = "InstructionsLabel";

	private var mRunning = false;
	
	private var mCounter = 0;
	
	private var mPeriodTime = 0;
	private var mTimer;
	
	private var mVibrations;

    function initialize() {
        View.initialize();
        mVibrations = new Vibrations();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() {
    }

    function onUpdate(dc) {
	    // draw the timer
	    var drawable = View.findDrawableById(DRAWABLE_TIMER);
    	drawTimer(drawable);

	    // draw instructions
	    drawable = View.findDrawableById(DRAWABLE_INSTRUCTIONS);
    	drawInstructions(drawable);
	    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() {
    }
    
    function drawTimer(drawable) {
    	var text;
    	
    	if (mRunning) {
    		text = Utils.formatTimerLabelClock(mPeriodTime);
    	} else {
    		text = "00:00";
    	}

		drawable.setText(text);	
    }
    
    function drawInstructions(drawable) {
    	var text;
    	
    	if (mRunning) {
    		text = "Rounds: " + mCounter;
    	} else {
    		text = "Press 'Start'";
		}
		
		drawable.setText(text);
    }
    
    function startActivity() {
    	// init vars
    	mRunning = true;
    	mPeriodTime = 0;
    	mCounter = 0;
    	
    	mTimer = new Timer.Timer();
    	mTimer.start(method(:timerAction), 1000, true);
    	
    	WatchUi.requestUpdate();
    }
    
    function stopActivity() {
    	mTimer.stop();
    	mVibrations.finish();
    	closeActivity();
    }
    
    function closeActivity() {
    	mRunning = false;
    	mPeriodTime = 0;
    	
    	WatchUi.requestUpdate();
    }
    
    function timerAction() {
    	if (mRunning) {
    		mVibrations.pause();
    		mPeriodTime++;
    	}
    	WatchUi.requestUpdate();
    }
	
    function isRunning() {
    	return mRunning;
	}
	
	function increaseCounter() {
		mCounter++;
	}	
	
}