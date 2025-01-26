
if !global.initialGameStart
{
	exit;
}

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
			_yStart = global.rightSideFromLane[1];
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.rightTraffic)
			_xStop = global.rightSideFromLane[0] + _bubbleSep;
			_yStop = global.rightSideFromLane[1];
			path_add_point(_path,_xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oLaneRightObject);
			_bubble.targetPath = _path;
			_bubble.fromLane = LANE.RIGHT;
			
			array_push(global.rightTraffic, _bubble);
		break;
		
		case LANE.LEFT:
		
			// Create bubble on the left side
			_xStart = -16;
			_yStart = global.leftSideFromLane[1];
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.leftTraffic)
			_xStop = global.leftSideFromLane[0] - _bubbleSep;
			_yStop = global.leftSideFromLane[1];
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oLaneLeftObject);
			_bubble.targetPath = _path;
			_bubble.fromLane = LANE.LEFT;
			
			array_push(global.leftTraffic, _bubble);
		break;
		
		case LANE.UP:
		
			// Create bubble on the up side
			_xStart = global.upSideFromLane[0];
			_yStart = -16;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.upTraffic)
			_xStop = global.upSideFromLane[0];
			_yStop = global.upSideFromLane[1] - _bubbleSep;
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oLaneUpObject);
			_bubble.targetPath = _path;
			_bubble.fromLane = LANE.UP;
			
			array_push(global.upTraffic, _bubble);
		break;
		
		case LANE.DOWN:
		
			// Create bubble on the down side
			_xStart = global.downSideFromLane[0];
			_yStart = global.roomHeight + 16;
			path_add_point(_path, _xStart, _yStart, 100);
			_bubbleSep = global.bubbleSeparation * array_length(global.downTraffic)
			_xStop =  global.downSideFromLane[0];
			_yStop =  global.downSideFromLane[1] + _bubbleSep;
			path_add_point(_path, _xStop, _yStop, 100);
			path_set_closed(_path, false);
			_bubble = instance_create_layer(_xStart, _yStart, "Instances", oLaneDownObject);
			_bubble.targetPath = _path;
			_bubble.fromLane = LANE.DOWN;
			
			array_push(global.downTraffic, _bubble);
		break;
	}
	
	// Reset timer
	bubbleSpawnTimer = global.bubbleSpawnFrequency;
}