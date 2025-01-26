//if (live_call()) return live_result;

if (room != rPlay)
{
	exit;
}

// Dont do anything for the first X seconds the game has started.
if !global.initialGameStart
{
	if global.initialGameStartTimer > 0.0
	{
		global.initialGameStartTimer--;
	}
	else
	{
		global.initialGameStart = true;
	}
	
	exit;
}

// Choosing lanes
if (requestedLaneChangeTimer > 0.0)
{
	requestedLaneChangeTimer--;
}
else
{
	var _laneStruct = choose(global.rightLaneRequest, global.leftLaneRequest, global.upLaneRequest, global.downLaneRequest);
	_laneStruct.active = true;
	_laneStruct.activeTimer = requestedLaneActiveTime;
	_laneStruct.requestedColor = irandom_range(COLOR.BLUE, COLOR.YELLOW);
	requestedLaneChangeTimer = requestedLaneChangeFrequency;
}

// Iterate through the different lanes
if global.rightLaneRequest.active
{
	if (global.rightLaneRequest.activeTimer > 0.0)
	{
		global.rightLaneRequest.activeTimer--;
	}
	else
	{
		global.rightLaneRequest.active = false;
		global.rightLaneRequest.requestedColor = COLOR.NONE;
	}
}

if global.leftLaneRequest.active
{
	if (global.leftLaneRequest.activeTimer > 0.0)
	{
		global.leftLaneRequest.activeTimer--;
	}
	else
	{
		global.leftLaneRequest.active = false;
		global.leftLaneRequest.requestedColor = COLOR.NONE;
	}
}

if global.upLaneRequest.active
{
	if (global.upLaneRequest.activeTimer > 0.0)
	{
		global.upLaneRequest.activeTimer--;
	}
	else
	{
		global.upLaneRequest.active = false;
		global.upLaneRequest.requestedColor = COLOR.NONE;
	}
}

if global.downLaneRequest.active
{
	if (global.downLaneRequest.activeTimer > 0.0)
	{
		global.downLaneRequest.activeTimer--;
	}
	else
	{
		global.downLaneRequest.active = false;
		global.downLaneRequest.requestedColor = COLOR.NONE;
	}
}








// Count game time
framesElapsed++;

if (framesElapsed >= SECOND)
{
	framesElapsed = 0.0;
	secondsElapsed++;
	
	if (secondsElapsed >= MINUTE)
	{
		secondsElapsed = 0.0;
		minutesElapsed++;
	}
}

minutesElapsed = clamp(minutesElapsed, 0, 99);

// Different thresholds for difficulty
switch (global.difficultyThreshold)
{
	case DIFFICULTY.BEGINNING:
		global.bubbleSpawnFrequency = SECOND * 4.0;
	break;
	
	case DIFFICULTY.EASY:
		global.bubbleSpawnFrequency = SECOND * 3.0;
	break;
	
	case DIFFICULTY.MEDIUM:
		global.bubbleSpawnFrequency = SECOND * 2.0;
	break;
	
	case DIFFICULTY.HARD:
		global.bubbleSpawnFrequency = SECOND * 1.0;
	break;
	
	case DIFFICULTY.EXTREME:
		global.bubbleSpawnFrequency = SECOND * 0.7;
	break;
	
	case DIFFICULTY.IMPOSSIBLE:
		global.bubbleSpawnFrequency = SECOND * 0.5;
	break;
}