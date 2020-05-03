using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Timer;

class BreathingView extends WatchUi.View {
	
	// Drawable ids
	const DRAWABLE_TIMER = "TimerLabel";
	const DRAWABLE_INSTRUCTIONS = "InstructionsLabel";

	private var mRunning = false;
	
	private var mPeriodTime = 0;
	private var mTimer;
	
	private var mVibrations;

    function initialize() {
        View.initialize();
        mVibrations = new Vibrations();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
	    // draw the timer
	    var drawable = View.findDrawableById(DRAWABLE_TIMER);
    	drawTimer(drawable);

	    // draw instructions
	    drawable = View.findDrawableById(DRAWABLE_INSTRUCTIONS);
    	drawInstructions(drawable);
	    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

//		drawCircles(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function drawTimer(drawable) {
    	var text;
    	
    	if (mRunning) {
    		text = Utils.formatTimerLabelClock(mPeriodTime);
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.no_value);
    	}

		drawable.setText(text);	
    }
    
    function drawInstructions(drawable) {
    	var text;
    	
    	if (mRunning) {
    		text = WatchUi.loadResource(Rez.Strings.breathe);
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.press_start);
		}
		
		drawable.setText(text);
    }
    
    function startActivity() {
    	// init vars
    	mRunning = true;
    	mPeriodTime = 0;
    	
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
	
	private function drawCircles(dc) {
        dc.setPenWidth(1);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        dc.drawCircle(33, 70, 30);
        dc.drawCircle(177, 120, 30);
		
	}
	
}