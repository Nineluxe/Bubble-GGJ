
// Initialize camera
global.camx = 0;
global.camy = 0;
global.roomWidth = 320;
global.roomHeight = 240;

// Define default path values
global.rightStartYValue = global.roomHeight / 4;
global.leftStartYValue = global.roomHeight - (global.roomHeight / 4);
global.rightStopXValue = global.roomWidth - (global.roomWidth / 4);
global.leftStopXValue = global.roomWidth / 4;

global.upStartXValue = global.roomWidth / 4;
global.downStartXValue = global.roomWidth - (global.roomWidth / 4);
global.upStopYValue = global.roomHeight / 4;
global.downStopYValue = global.roomHeight - (global.roomHeight / 4);

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

