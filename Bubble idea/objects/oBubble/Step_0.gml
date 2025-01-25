
if (targetPath == undefined)
{
	exit;
}

// Start pathing
if !pathInitialized
{
	if (startPathingTimer <= 0.0)
	{
		pathInitialized = true;
		path_start(targetPath, movespeed, path_action_stop, false);
	}
	else
	{
		startPathingTimer -= 1.0;
	}
}


//if (path_position == 1) and (!targetPathStarted)
//{
//	targetPathStarted = true;
	
//	path_end();
//	path_delete(currentPath);
//	path_start(targetPath, movespeed, path_action_stop, false);
//}