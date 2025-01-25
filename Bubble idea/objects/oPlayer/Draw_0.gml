
var i = 0;
var ySeperation = 16;
var _x = global.camx + global.roomWidth / 2;
var _y = global.camy + global.roomHeight / 2;

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_text(_x, _y + (i * ySeperation), "Current Step: " + string(currentStepString));
i++;
draw_text(_x, _y + (i * ySeperation), "Selected Lane: " + string(selectedLaneString));
i++;
draw_text(_x, _y + (i * ySeperation), "# of Bubbles: " + string(numberBubbles));
i++;
draw_text(_x, _y + (i * ySeperation), "Horizontal: " + string(horizontalDirection));
i++;
draw_text(_x, _y + (i * ySeperation), "Vertical: " + string(verticalDirection));
i++;