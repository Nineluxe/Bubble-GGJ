
var i = 0;
var ySeperation = 16;
var _x = global.camx + global.roomWidth / 2;
var _y = global.camy + global.roomHeight / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(_x, _y + (i * ySeperation), "Current Step: " + string(currentStepString));
i++;
draw_text(_x, _y + (i * ySeperation), "# of Bubbles: " + string(numberBubbles));
i++;

// Draw From lane
if (selectedLane != LANE.NONE)
{
	var _x1 = 0, _x2 = 0, _y1 = 0, _y2 = 0;
	var _padding = 16;
	
	switch (selectedLane)
	{
		case LANE.LEFT:
			_x1 = 0; 
			_x2 = global.leftSideFromLane[0] + _padding; 
			_y1 = global.leftSideFromLane[1] - _padding; 
			_y2 = global.leftSideFromLane[1] + _padding; 
		break;
		case LANE.RIGHT:
			_x1 = global.roomWidth; 
			_x2 = global.rightSideFromLane[0] - _padding; 
			_y1 = global.rightSideFromLane[1] - _padding; 
			_y2 = global.rightSideFromLane[1] + _padding; 
		break;
		case LANE.UP:
			_x1 = global.upSideFromLane[0] - _padding;
			_x2 = global.upSideFromLane[0] + _padding; 
			_y1 = 0;
			_y2 = global.upSideFromLane[1] + _padding;
		break;
		case LANE.DOWN:
			_x1 = global.downSideFromLane[0] - _padding;
			_x2 = global.downSideFromLane[0] + _padding;
			_y1 = global.roomHeight;
			_y2 = global.downSideFromLane[1] - _padding;
		break;
	}
		
	// Draw highlighted lane
	draw_set_alpha(0.3);
	draw_rectangle_color(
		_x1,_y1,_x2,_y2,c_green,c_green,c_green,c_green,false
	);
	draw_set_alpha(1.0);
}


// Draw To lane
if (targetLane != LANE.NONE)
{
	var _x1 = 0, _x2 = 0, _y1 = 0, _y2 = 0;
	var _padding = 16;
	
	switch (targetLane)
	{
		case LANE.LEFT:
			_x1 = 0; 
			_x2 = global.leftSideToLane[0] + _padding; 
			_y1 = global.leftSideToLane[1] - _padding; 
			_y2 = global.leftSideToLane[1] + _padding; 
		break;
		case LANE.RIGHT:
			_x1 = global.roomWidth; 
			_x2 = global.rightSideToLane[0] - _padding; 
			_y1 = global.rightSideToLane[1] - _padding; 
			_y2 = global.rightSideToLane[1] + _padding; 
		break;
		case LANE.UP:
			_x1 = global.upSideToLane[0] - _padding;
			_x2 = global.upSideToLane[0] + _padding; 
			_y1 = 0;
			_y2 = global.upSideToLane[1] + _padding;
		break;
		case LANE.DOWN:
			_x1 = global.downSideToLane[0] - _padding;
			_x2 = global.downSideToLane[0] + _padding;
			_y1 = global.roomHeight;
			_y2 = global.downSideToLane[1] - _padding;
		break;
	}
		
	// Draw highlighted lane
	draw_set_alpha(0.3);
	draw_rectangle_color(
		_x1,_y1,_x2,_y2,c_red,c_red,c_red,c_red,false
	);
	draw_set_alpha(1.0);
}
