
// Get player input
horizontalDirection = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
verticalDirection = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

// Logic for selecting lanes
switch (currentStep)
{
	case (STEP.HIGHLIGHT_LANE):
		
		// Debug string
		currentStepString = "Choose lane";
		if (horizontalDirection != 0) or (verticalDirection != 0)
		{
			selectedLane = getLaneSelection(horizontalDirection, verticalDirection);
			
			switch (selectedLane)
			{
				case LANE.LEFT:
					selectedTrafficArray = global.leftTraffic;
				break;
			
				case LANE.RIGHT:
					selectedTrafficArray = global.rightTraffic;
				break;
			
				case LANE.UP:
					selectedTrafficArray = global.upTraffic;
				break;
			
				case LANE.DOWN:
					selectedTrafficArray = global.downTraffic;
				break;
			}
			
			// Make sure selected lane has bubbles
			if (array_length(selectedTrafficArray) <= 0)
			{
				selectedLane = undefined;
			}
			else
			{
				currentStep++;
			}
		}
	break;
	
	case (STEP.SELECT_TARGET_LANE):
		currentStepString = "Choose target";
		
		if (horizontalDirection != 0) or (verticalDirection != 0)
		{
			targetLane = getLaneSelection(horizontalDirection, verticalDirection);
			currentStep++;
		}
	break;
	
	case (STEP.NUM_BUBBLES):
		
		currentStepString = "Number of bubbles";
		
		// Choose how many bubbles to send where
		switch (targetLane)
		{
			case LANE.LEFT:
				numberBubbles += -horizontalDirection;
			break;
			
			case LANE.RIGHT:
				numberBubbles += horizontalDirection;
			break;
			
			case LANE.UP:
				numberBubbles += -verticalDirection;
			break;
			
			case LANE.DOWN:
				numberBubbles += verticalDirection;
			break;
		}
		
		// Clamp bubble amount
		numberBubbles = clamp(numberBubbles, 0, array_length(selectedTrafficArray));	
		numberBubbles = clamp(numberBubbles, 0, global.bubbleLaneAmount);
		
		// Add pointer fingers for selecting bubbles
		if (numberBubbles > array_length(pointerFingerArray))
		{
			var _x = 0;
			var _y = 0;
			
			switch(selectedTrafficArray)
			{
				case global.leftTraffic:
					_x = global.leftSideFromLane[0] - (global.bubbleSeparation * (numberBubbles - 1));
					_y = global.leftSideFromLane[1] - 16;
				break;
				
				case global.rightTraffic:
					_x = global.rightSideFromLane[0] + (global.bubbleSeparation * (numberBubbles - 1));
					_y = global.rightSideFromLane[1] - 16;
				break;
				
				case global.upTraffic:
					_x = global.upSideFromLane[0];
					_y = global.upSideFromLane[1] - 16 - (global.bubbleSeparation * (numberBubbles - 1));
				break;
				
				case global.downTraffic:
					_x = global.downSideFromLane[0];
					_y = global.downSideFromLane[1] - 16 + (global.bubbleSeparation * (numberBubbles - 1));
				break;
			}
			
			var _newFingerInstance = instance_create_layer(_x, _y, "Pointers", oFX);
			array_push(pointerFingerArray, _newFingerInstance);
		}
		else if (numberBubbles < array_length(pointerFingerArray))
		{
			var _deletedFingerInstance = array_pop(pointerFingerArray);
			instance_destroy(_deletedFingerInstance);
		}
				

		// Send the bubbles
		if (keyboard_check_pressed(vk_space))
		{
			// Delete them from the array
			repeat(numberBubbles)
			{
				var _inst = selectedTrafficArray[0];
				moveBubbles(_inst, selectedLane, targetLane);
				_inst.isCrossingRoad = true;
				array_shift(selectedTrafficArray);
			}
			
			// Shift other bubbles forward
			if (array_length(selectedTrafficArray) > 0)
			{
				alignBubbles(selectedTrafficArray);
			}
			
			numberBubbles = 0;
			currentStep = STEP.HIGHLIGHT_LANE;
			selectedLane = LANE.NONE;
			targetLane = LANE.NONE;
			
			// Reset pointer finger array
			for (var i = 0; i < array_length(pointerFingerArray); i++)
			{
				instance_destroy(pointerFingerArray[i]);
			}
			
			pointerFingerArray = -1;
			pointerFingerArray = [];
		}
	break;
}




// Debug
if (keyboard_check_pressed(vk_escape))
{
	game_end();
}
