
if (targetPath == undefined)
{
	exit;
}

// Start pathing
if !pathInitialized
{
	pathInitialized = true;
	
	xTarget = path_get_point_x(targetPath, 1);
	yTarget = path_get_point_y(targetPath, 1);
	
	currentPath = path_add();
	path_set_closed(currentPath, false);

	path_add_point(currentPath, x, y, 100);	
	path_add_point(currentPath, xTarget, yTarget, 100);

	path_start(currentPath, movespeed, path_action_stop, false);
}


if (path_position == 1) and (!targetPathStarted)
{
	targetPathStarted = true;
	
	path_end();
	path_delete(currentPath);
	path_start(targetPath, movespeed, path_action_stop, false);
}