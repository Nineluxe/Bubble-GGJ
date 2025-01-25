
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
