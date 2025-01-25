

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
				_xStop = global.rightStopXValue + _bubbleSep;
				_yStop = global.rightStartYValue;
				
			break;
		
			case global.leftTraffic:
		
				// Create bubble on the left side
				_xStop = global.leftStopXValue - _bubbleSep;
				_yStop = global.leftStartYValue;
				
			break;
		
			case global.upTraffic:
		
				// Create bubble on the up side
				_xStop = global.upStartXValue;
				_yStop = global.upStopYValue - _bubbleSep;

			break;
		
			case global.downTraffic:
		
				// Create bubble on the down side
				_xStop = global.downStartXValue;
				_yStop = global.downStopYValue + _bubbleSep;

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