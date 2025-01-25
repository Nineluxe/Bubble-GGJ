
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

//// Draw highlighted lane
//if (selectedLane != LANE.NONE)
//{
//	var _x1 = 0, _x2 = 0, _y1 = 0, _y2 = 0;
//	var _padding = 16;
	
//	switch (selectedLane)
//	{
//		case LANE.LEFT:
//			_x1 = 0; 
//			_x2 = global.leftStopXValue + _padding; 
//			_y1 = global.leftStartYValue - _padding * 1.5;
//			_y2 = global.leftStartYValue + (_padding * 1.5);
//		break;
//		case LANE.RIGHT:
//			_x1 = global.roomWidth; 
//			_x2 = global.rightStopXValue - _padding; 
//			_y1 = global.rightStartYValue - _padding * 1.5;
//			_y2 = global.rightStartYValue + (_padding * 1.5);
//		break;
//		case LANE.UP:
//			_x1 = global.upStartXValue - _padding * 1.5; 
//			_x2 = global.upStartXValue + _padding * 1.5; 
//			_y1 = 0;
//			_y2 = global.upStopYValue + (_padding * 1.5);
//		break;
//		case LANE.DOWN:
//			_x1 = global.downStartXValue - _padding * 1.5; 
//			_x2 = global.downStartXValue + _padding * 1.5; 
//			_y1 = global.roomHeight;
//			_y2 = global.downStopYValue - (_padding * 1.5);
//		break;
//	}
		
//	// Draw highlighted lane
//	draw_set_alpha(0.3);
//	draw_rectangle_color(
//		_x1,_y1,_x2,_y2,c_green,c_green,c_green,c_green,false
//	);
//	draw_set_alpha(1.0);
//}

//// Draw highlighted lane
//if (targetLane != LANE.NONE)
//{
//	var _x1 = 0, _x2 = 0, _y1 = 0, _y2 = 0;
//	var _padding = 16;
	
//	switch (targetLane)
//	{
//		case LANE.LEFT:
//			_x1 = 0; 
//			_x2 = global.leftStopXValue + _padding; 
//			_y1 = global.leftSideTarget[1];
//			_y2 = global.leftSideTarget[1] + 1;
//		break;
//		case LANE.RIGHT:
//			_x1 = global.roomWidth; 
//			_x2 = global.rightStopXValue - _padding; 
//			_y1 = global.roomHeight - (global.rightStartYValue - _padding * 1.5);
//			_y2 = global.roomHeight - (global.rightStartYValue + (_padding * 1.5));
//		break;
//		case LANE.UP:
//			_x1 = global.roomWidth - (global.upStartXValue - _padding * 1.5); 
//			_x2 = global.roomWidth - (global.upStartXValue + _padding * 1.5); 
//			_y1 = 0;
//			_y2 = global.upStopYValue + (_padding * 1.5);
//		break;
//		case LANE.DOWN:
//			_x1 = global.roomWidth - (global.downStartXValue - _padding * 1.5); 
//			_x2 = global.roomWidth - (global.downStartXValue + _padding * 1.5); 
//			_y1 = global.roomHeight;
//			_y2 = global.downStopYValue - (_padding * 1.5);
//		break;
//	}
		
//	// Draw highlighted lane
//	draw_set_alpha(0.3);
//	draw_rectangle_color(
//		_x1,_y1,_x2,_y2,c_red,c_red,c_red,c_red,false
//	);
//	draw_set_alpha(1.0);
//}