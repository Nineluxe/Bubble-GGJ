/// @description Destroy bubble off screen

if !isCrossingRoad
{
	exit;
}

global.score += bubbleScore;

instance_destroy();
