randomize();

// Initialize camera
global.camx = 0;
global.camy = 0;
global.roomWidth = 320;
global.roomHeight = 240;

// Define default path values
divider = 4;
global.rightStartYValue = (global.roomHeight / (divider - 1));
global.leftStartYValue = global.roomHeight - (global.roomHeight / (divider - 1));
global.rightStopXValue = global.roomWidth - (global.roomWidth / divider);
global.leftStopXValue = global.roomWidth / divider;

global.upStartXValue = global.roomWidth / (divider - 1);
global.downStartXValue = global.roomWidth - (global.roomWidth / (divider - 1));
global.upStopYValue = global.roomHeight / divider;
global.downStopYValue = global.roomHeight - (global.roomHeight / divider);

global.rightTraffic = [];
global.leftTraffic = [];
global.upTraffic = [];
global.downTraffic = [];

global.bubbleSeparation = 16;
global.bubbleMovespeed = 1.0;
global.bubblePathingWaitTime = global.bubbleSeparation / global.bubbleMovespeed;

// Initialize Step For Player
enum STEP
{
	HIGHLIGHT_LANE,
	SELECT_TARGET_LANE,
	NUM_BUBBLES
}

// Initialize lanes
enum LANE
{
	NONE,
	LEFT,
	DOWN,
	RIGHT,
	UP,
	TOTAL
}

