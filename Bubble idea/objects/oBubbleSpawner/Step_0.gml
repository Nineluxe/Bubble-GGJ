
if (bubbleSpawnTimer > 0.0)
{
	bubbleSpawnTimer--; 
}
else
{
	// Creating bubbles
	var _lane = choose(LANE.RIGHT, LANE.LEFT, LANE.UP, LANE.DOWN);
	var _path = path_add();
	var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
	var _bubble;
	
	switch (_lane)
	{
		case LANE.RIGHT:
		
			// Create bubble on the right side
			_xStart = global.roomWidth + 16;
			_yStart = global.rightStartYValue;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.rightTraffic)
			_xStop = global.rightStopXValue + _bubbleSep;
			_yStop = global.rightStartYValue;
			path_add_point(_path,_xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
			
			array_push(global.rightTraffic, _bubble);
		break;
		
		case LANE.LEFT:
		
			// Create bubble on the left side
			_xStart = -16;
			_yStart = global.leftStartYValue;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.leftTraffic)
			_xStop = global.leftStopXValue - _bubbleSep;
			_yStop = global.leftStartYValue;
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
			
			array_push(global.leftTraffic, _bubble);
		break;
		
		case LANE.UP:
		
			// Create bubble on the up side
			_xStart = global.upStartXValue;
			_yStart = -16;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.upTraffic)
			_xStop = global.upStartXValue;
			_yStop = global.upStopYValue - _bubbleSep;
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
			
			array_push(global.upTraffic, _bubble);
		break;
		
		case LANE.DOWN:
		
			// Create bubble on the down side
			_xStart = global.downStartXValue;
			_yStart = global.roomHeight + 16;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.downTraffic)
			_xStop =  global.downStartXValue;
			_yStop =  global.downStopYValue + _bubbleSep;
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oBubble);
			_bubble.targetPath = _path;
			
			array_push(global.downTraffic, _bubble);
		break;
	}
	
	// Reset timer
	bubbleSpawnTimer = bubbleSpawnFrequency
}