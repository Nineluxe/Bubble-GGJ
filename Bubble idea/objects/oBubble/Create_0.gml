
// Stats
movespeed = global.bubbleMovespeed;

// General Variables
fromLane = LANE.NONE;
targetPath = undefined;
pathInitialized = false;
startPathingTimer = 0.0;
isCrossingRoad = false; // Used to check if its crossing the intersection

color = irandom_range(COLOR.BLUE, COLOR.YELLOW);

switch (color)
{
	case COLOR.BLUE:
		sprite_index = sBubbleBlue;
	break;
	
	case COLOR.GREEN:
		sprite_index = sBubbleGreen;
	break;
	
	case COLOR.PINK:
		sprite_index = sBubblePink;
	break;
	
	case COLOR.YELLOW:
		sprite_index = sBubbleYellow;
	break;
}