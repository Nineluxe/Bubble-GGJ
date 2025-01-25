
// Get player input
horizontalDirection = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
verticalDirection = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

// Logic for selecting lanes
switch (currentStep)
{
	case (STEP.HIGHLIGHT_LANE):
		
		currentStepString = "Choose lane";
		if (horizontalDirection != 0) or (verticalDirection != 0)
		{
			selectedLane = getLaneSelection(horizontalDirection, verticalDirection);
			currentStep++;
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
		
		if (keyboard_check_pressed(vk_space))
		{
			numberBubbles = 0;
			currentStep = STEP.HIGHLIGHT_LANE;
		}
	break;
}




// Debug
if (keyboard_check_pressed(vk_escape))
{
	game_end();
}
