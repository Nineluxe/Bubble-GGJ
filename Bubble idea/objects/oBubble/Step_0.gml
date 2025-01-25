
if (targetPath == undefined)
{
	exit;
}

// Start pathing
if !pathInitialized
{
	pathInitialized = true;

	path_start(targetPath, movespeed, path_action_stop, false);
}


//if (path_position == 1) and (!targetPathStarted)
//{
//	targetPathStarted = true;
	
//	path_end();
//	path_delete(currentPath);
//	path_start(targetPath, movespeed, path_action_stop, false);
//}