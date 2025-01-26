randomize();

#macro SECOND 60.0
#macro MINUTE 60.0


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

global.score = 0.0;
global.lives = 3;

global.initialGameStart = false;
global.initialGameStartTimer = SECOND * 1;

global.bubbleSpawnFrequency = SECOND * 1.0;

secondsElapsed = 0.0;
minutesElapsed = 0.0;
framesElapsed = 0.0;

requestedLaneChangeFrequency = SECOND * 10.0; // How often the lane change timer changes
requestedLaneChangeTimer = requestedLaneChangeFrequency; // Timer to measure length
requestedLaneActiveTime = requestedLaneChangeFrequency; // How long the timer is created for that specific lane

global.difficultyThreshold = DIFFICULTY.BEGINNING;


global.rightLaneRequest = 
{
	active : false,
	activeTimer : 0.0,
	requestedColor : COLOR.NONE,
	lightSprite : sLightBlue,
	
	drawLight : function()
	{
		switch (requestedColor)
		{
			case COLOR.BLUE: lightSprite = sLightBlue; break;
			case COLOR.PINK: lightSprite = sLightPink; break;
			case COLOR.GREEN: lightSprite = sLightGreen; break;
			case COLOR.YELLOW: lightSprite = sLightYellow; break;
		}
		
		draw_sprite(lightSprite, -1, global.rightSideToLane[0], global.rightSideToLane[1]); 
	}
	
};

global.leftLaneRequest = 
{
	active : false,
	activeTimer : 0.0,
	requestedColor : COLOR.NONE,
	lightSprite : sLightBlue,
	
	drawLight : function()
	{
		switch (requestedColor)
		{
			case COLOR.BLUE: lightSprite = sLightBlue; break;
			case COLOR.PINK: lightSprite = sLightPink; break;
			case COLOR.GREEN: lightSprite = sLightGreen; break;
			case COLOR.YELLOW: lightSprite = sLightYellow; break;
		}
		
		draw_sprite(lightSprite, -1, global.leftSideToLane[0], global.leftSideToLane[1]); 
	}
};

global.upLaneRequest = 
{
	active : false,
	activeTimer : 0.0,
	requestedColor : COLOR.NONE,
	lightSprite : sLightBlue,
	
	drawLight : function()
	{
		switch (requestedColor)
		{
			case COLOR.BLUE: lightSprite = sLightBlue; break;
			case COLOR.PINK: lightSprite = sLightPink; break;
			case COLOR.GREEN: lightSprite = sLightGreen; break;
			case COLOR.YELLOW: lightSprite = sLightYellow; break;
		}
		
		draw_sprite(lightSprite, -1, global.upSideToLane[0], global.upSideToLane[1]); 
	}
};

global.downLaneRequest = 
{
	active : false,
	activeTimer : 0.0,
	requestedColor : COLOR.NONE,
	lightSprite : sLightBlue,
	
	drawLight : function()
	{
		switch (requestedColor)
		{
			case COLOR.BLUE: lightSprite = sLightBlue; break;
			case COLOR.PINK: lightSprite = sLightPink; break;
			case COLOR.GREEN: lightSprite = sLightGreen; break;
			case COLOR.YELLOW: lightSprite = sLightYellow; break;
		}
		
		draw_sprite(lightSprite, -1, global.downSideToLane[0], global.downSideToLane[1]); 
	}
};

enum DIFFICULTY
{
	BEGINNING,
	EASY,
	MEDIUM,
	HARD,
	EXTREME,
	IMPOSSIBLE
}

// Initialize Bubble Colors
enum COLOR
{
	BLUE,
	GREEN,
	PINK,
	YELLOW,
	TOTAL,
	NONE
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

