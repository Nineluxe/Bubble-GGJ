//if (live_call()) return live_result;



// Inherit the parent event
event_inherited();

if !(isCrossingRoad)
{
	exit;
}

var _collide = instance_place(x, y, [oLaneLeftObject, oLaneRightObject, oLaneDownObject]);

if _collide
{
	if instance_exists(_collide)
	{
		instance_destroy(_collide);
	}
	
	instance_destroy();
}