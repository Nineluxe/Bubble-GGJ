
if (targetPath == undefined)
{
	exit;
}

// Start pathing
if !pathInitialized
{
	if (startPathingTimer <= 0.0)
	{
		pathInitialized = true;
		path_start(targetPath, movespeed, path_action_stop, false);
	}
	else
	{
		startPathingTimer -= 1.0;
	}
}

if !(isCrossingRoad)
{
	exit;
}

ds_list_clear(collisionList);
var _count = instance_place_list(x, y, oBubble, collisionList, false);

if (_count > 0)
{
	for (var i = 0; i < _count; i++)
	{
		var _collidingInst = collisionList[| i];
		
		if (_collidingInst.fromLane != fromLane)
		{
			if (instance_exists(_collidingInst))
			{
				instance_destroy(_collidingInst);
			}
			
			// Destroy myself
			instance_destroy();
		}
	}
}

