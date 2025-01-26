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
	
	var _popFX = instance_create_layer(x, y, "Instances", oBubblePop);
	_popFX.color = color;
	
	audio_play_sound(Aggressive_Bubble_Pop, 0, false, global.soundFXGain * global.masterGain);
	instance_destroy();
}