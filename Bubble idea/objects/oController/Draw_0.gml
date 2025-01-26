//if (live_call()) return live_result;

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_alpha(1.0);

var _seconds = string_replace_all(string_format(secondsElapsed, 2, 0), " ", "0")
var _time = string(minutesElapsed) + ":" + _seconds;
draw_text(global.camx + (global.roomWidth / 2), global.camy + 8, _time);
draw_text(global.camx + (global.roomWidth / 2), global.camy + 16, "Score: " + string(global.score));

if global.rightLaneRequest.active
{
	global.rightLaneRequest.drawLight();
}

if global.leftLaneRequest.active
{
	global.leftLaneRequest.drawLight();
}

if global.upLaneRequest.active
{
	global.upLaneRequest.drawLight();
}

if global.downLaneRequest.active
{
	global.downLaneRequest.drawLight();
}