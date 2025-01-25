
// Get lane selection
function getLaneSelection(horizontalDirection, verticalDirection)
{
	if (horizontalDirection != 0)
	{
		if (horizontalDirection == -1)
		{
			return LANE.LEFT;
		}
		else
		{
			return LANE.RIGHT;
		}
	}
	else if (verticalDirection != 0)
	{
		if (verticalDirection == -1)
		{
			return LANE.UP;
		}
		else
		{
			return LANE.DOWN;
		}
	}
}


// Path bubbles movement
// Takes bubble instance, the lane sent from, and the lane sending to.
function moveBubbles(_inst, _fromLane, _toLane)
{
	switch (_fromLane)
	{
		case LANE.RIGHT:
			bubbleFromRight(_inst, _toLane);
		break;
		case LANE.LEFT:
			bubbleFromLeft(_inst, _toLane);
		break;
		case LANE.UP:
			bubbleFromUp(_inst, _toLane);
		break;
		case LANE.DOWN:
			bubbleFromDown(_inst, _toLane);
		break;
	}
}


// Sending bubbles from the right lane to somewhere else
function bubbleFromRight(_inst, _toLane)
{
	// Initialize path variables
	var _path = path_add();
	var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
		
	// Erase current path
	with (_inst)
	{
		path_clear_points(targetPath);
		pathInitialized = false;
	}
	
	// These are common variables between every lane
	_xStart = _inst.x;
	_yStart = _inst.y;
		
	switch (_toLane)
	{
		case LANE.RIGHT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.rightSideFromLane[0], global.rightSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.rightSideFromLane[0] - 32, global.rightSideToLane[1] - 16, 100); // Rounding out the curve
			path_add_point(_path, global.rightSideToLane[0], global.rightSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, global.roomWidth + 16, global.rightSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
	
		break;
		
		case LANE.LEFT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.rightSideFromLane[0], global.rightSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.leftSideToLane[0], global.leftSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, -16, global.leftSideToLane[1], 100); // Off screen
			
		break;
		
		case LANE.UP:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.rightSideFromLane[0], global.rightSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.upSideToLane[0] + 8, global.rightSideFromLane[1], 100); // Rounding the curve
			path_add_point(_path, global.upSideToLane[0], global.upSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.upSideToLane[0], -16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.DOWN:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.rightSideFromLane[0], global.rightSideFromLane[1], 100); // Stop point
			path_add_point(_path,  global.downSideToLane[0],  global.downSideToLane[1] - 48, 100); // Rounding the curve
			path_add_point(_path, global.downSideToLane[0], global.downSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.downSideToLane[0], global.roomHeight + 16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);	
			
		break;
	}
	
	path_set_closed(_path, false);
	_inst.targetPath = _path;
}



// Sending bubbles from the right lane to somewhere else
function bubbleFromLeft(_inst, _toLane)
{
	// Initialize path variables
	var _path = path_add();
	var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
		
	// Erase current path
	with (_inst)
	{
		path_clear_points(targetPath);
		pathInitialized = false;
	}
	
	// These are common variables between every lane
	_xStart = _inst.x;
	_yStart = _inst.y;
		
	switch (_toLane)
	{
		case LANE.RIGHT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.leftSideFromLane[0], global.leftSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.rightSideToLane[0], global.rightSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, global.roomWidth + 16, global.rightSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
	
		break;
		
		case LANE.LEFT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.leftSideFromLane[0], global.leftSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.leftSideToLane[0] + 32, global.leftSideToLane[1] + 16, 100); // Rounding out the curve
			path_add_point(_path, global.leftSideToLane[0], global.leftSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, -16, global.leftSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.UP:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.leftSideFromLane[0], global.leftSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.upSideToLane[0] - 8, global.leftSideFromLane[1], 100); // Rounding the curve
			path_add_point(_path, global.upSideToLane[0], global.upSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.upSideToLane[0], -16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.DOWN:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.leftSideFromLane[0], global.leftSideFromLane[1], 100); // Stop point
			path_add_point(_path,  global.downSideToLane[0],  global.downSideToLane[1] - 16, 100); // Rounding the curve
			path_add_point(_path, global.downSideToLane[0], global.downSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.downSideToLane[0], global.roomHeight + 16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);	
			
		break;
	}
	
	path_set_closed(_path, false);
	_inst.targetPath = _path;
}




// Sending bubbles from the right lane to somewhere else
function bubbleFromUp(_inst, _toLane)
{
	// Initialize path variables
	var _path = path_add();
	var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
		
	// Erase current path
	with (_inst)
	{
		path_clear_points(targetPath);
		pathInitialized = false;
	}
	
	// These are common variables between every lane
	_xStart = _inst.x;
	_yStart = _inst.y;
		
	switch (_toLane)
	{
		case LANE.RIGHT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.upSideFromLane[0], global.upSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.rightSideToLane[0] - 64, global.rightSideToLane[1], 100); // Round
			path_add_point(_path, global.rightSideToLane[0], global.rightSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, global.roomWidth + 16, global.rightSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
	
		break;
		
		case LANE.LEFT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.upSideFromLane[0], global.upSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.leftSideToLane[0] + 16, global.leftSideToLane[1], 100); // Rounding out the curve
			path_add_point(_path, global.leftSideToLane[0], global.leftSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, -16, global.leftSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.UP:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.upSideFromLane[0], global.upSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.upSideToLane[0] - 16, global.upSideFromLane[1] + 32, 100); // Rounding the curve
			path_add_point(_path, global.upSideToLane[0], global.upSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.upSideToLane[0], -16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.DOWN:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.upSideFromLane[0], global.upSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.downSideToLane[0], global.downSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.downSideToLane[0], global.roomHeight + 16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);	
			
		break;
	}
	
	path_set_closed(_path, false);
	_inst.targetPath = _path;
}



// Sending bubbles from the right lane to somewhere else
function bubbleFromDown(_inst, _toLane)
{
	// Initialize path variables
	var _path = path_add();
	var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
		
	// Erase current path
	with (_inst)
	{
		path_clear_points(targetPath);
		pathInitialized = false;
	}
	
	// These are common variables between every lane
	_xStart = _inst.x;
	_yStart = _inst.y;
		
	switch (_toLane)
	{
		case LANE.RIGHT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.downSideFromLane[0], global.downSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.rightSideToLane[0] - 32, global.rightSideToLane[1], 100); // Round
			path_add_point(_path, global.rightSideToLane[0], global.rightSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, global.roomWidth + 16, global.rightSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
	
		break;
		
		case LANE.LEFT:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.downSideFromLane[0], global.downSideFromLane[1], 100); // To the stop point
			path_add_point(_path, global.leftSideToLane[0] + 64, global.leftSideToLane[1], 100); // Rounding out the curve
			path_add_point(_path, global.leftSideToLane[0], global.leftSideToLane[1], 100); // To the "to" lane
			path_add_point(_path, -16, global.leftSideToLane[1], 100); // Finally off-screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.UP:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.downSideFromLane[0], global.downSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.upSideToLane[0], global.upSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.upSideToLane[0], -16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);
			
		break;
		
		case LANE.DOWN:
		
			path_add_point(_path, _xStart, _yStart, 100);
			path_add_point(_path, global.downSideFromLane[0], global.downSideFromLane[1], 100); // Stop point
			path_add_point(_path, global.downSideToLane[0] + 16, global.downSideFromLane[1] - 32, 100); // Rounding the curve
			path_add_point(_path, global.downSideToLane[0], global.downSideToLane[1], 100);	// To the "to" lane
			path_add_point(_path, global.downSideToLane[0], global.roomHeight + 16, 100); // Off screen
			
			// Make path smooth
			path_set_kind(_path, 1);	
			
		break;
	}
	
	path_set_closed(_path, false);
	_inst.targetPath = _path;
}





// Align Bubbles
function alignBubbles(_trafficArray)
{
	for (var i = 0; i < array_length(_trafficArray); i++)
	{
		// Creating bubbles
		var _path = path_add();
		var _xStart, _yStart, _xStop, _yStop, _bubbleSep;
		var _bubble = _trafficArray[i];
		
		// Erase current path
		with (_bubble)
		{
			path_clear_points(targetPath);
			pathInitialized = false;
		}
		
		// These are common variables between every lane
		_xStart = _bubble.x;
		_yStart = _bubble.y;
		path_add_point(_path, _xStart, _yStart, 100);
		_bubbleSep = global.bubbleSeparation * i;
	
		switch (_trafficArray)
		{
			case global.rightTraffic:
				
				// Create bubble on the right side
				_xStop = global.rightSideFromLane[0] + _bubbleSep;
				_yStop = global.rightSideFromLane[1];
				
			break;
		
			case global.leftTraffic:
		
				// Create bubble on the left side
				_xStop = global.leftSideFromLane[0] - _bubbleSep;
				_yStop = global.leftSideFromLane[1];
				
			break;
		
			case global.upTraffic:
		
				// Create bubble on the up side
				_xStop = global.upSideFromLane[0]
				_yStop = global.upSideFromLane[1] - _bubbleSep;

			break;
		
			case global.downTraffic:
		
				// Create bubble on the down side
				_xStop = global.downSideFromLane[0]
				_yStop = global.downSideFromLane[1] + _bubbleSep;

			break;
		}
		
		// Set the bubble on its merry way
		path_add_point(_path, _xStop, _yStop, 100);
		path_set_closed(_path, false);
		_bubble.targetPath = _path;
		
		// Set how long they have to wait if they're not first in line.
		_bubble.startPathingTimer = global.bubblePathingWaitTime * i;
	}
}