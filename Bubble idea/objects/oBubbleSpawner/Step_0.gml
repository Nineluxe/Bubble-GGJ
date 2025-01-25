
if (bubbleSpawnTimer > 0.0)
{
	bubbleSpawnTimer--; 
}
else
{
	// Creating bubbles
	var _lane = choose(LANE.LEFT, LANE.RIGHT, LANE.DOWN, LANE.UP);
	var _path = path_add();
	var _xStart, _yStart;
	var _bubble;
	
	switch (_lane)
	{
		case LANE.RIGHT:
		
			// Create bubble on the right side
			_xStart = global.roomWidth + 16;
			_yStart = global.rightStartYValue;
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.rightStopXValue, global.rightStartYValue, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
		break;
		
		case LANE.LEFT:
		
			// Create bubble on the right side
			_xStart = -16;
			_yStart = global.leftStartYValue;
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.leftStopXValue, global.leftStartYValue, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
		break;
		
		case LANE.UP:
		
			// Create bubble on the right side
			_xStart = global.upStartXValue;
			_yStart = -16;
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.upStartXValue, global.upStopYValue, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
		break;
		
		case LANE.DOWN:
		
			// Create bubble on the right side
			_xStart = global.downStartXValue;
			_yStart = global.roomHeight + 16;
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.downStartXValue, global.downStopYValue, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
		break;
	}
	
	// Reset timer
	bubbleSpawnTimer = bubbleSpawnFrequency
}