randomize();

// Initialize camera
global.camx = 0;
global.camy = 0;
global.roomWidth = 320;
global.roomHeight = 240;


global.bubbleSeparation = 16;
global.bubbleMovespeed = 1.0;
global.bubblePathingWaitTime = global.bubbleSeparation / global.bubbleMovespeed;

// How many bubbles can line up in each lane
global.bubbleLaneAmount = 6;

global.rightTraffic = [];
global.leftTraffic = [];
global.upTraffic = [];
global.downTraffic = [];

// Initialize Bubble Colors
enum COLOR
{
	BLUE,
	GREEN,
	PINK,
	YELLOW,
	TOTAL
}

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

