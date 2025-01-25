
if (bubbleSpawnTimer > 0.0)
{
	bubbleSpawnTimer--; 
}
else
{
	// Create bubble
	var _path = choose(pRightDown, pRightUp, pRightLeft, pRightRight);
	var _x = path_get_point_x(_path, 0);
	var _y = path_get_point_y(_path, 0);
	var _bubble = instance_create_layer(_x, _y, "Instances", oBubble);
	_bubble.targetPath = _path;
	
	// Reset timer
	bubbleSpawnTimer = bubbleSpawnFrequency
}