

function getLaneSelection(horizontalDirection, verticalDirection)
{
	if (horizontalDirection != 0)
	{
		if (horizontalDirection == -1)
		{
			return LANE.LEFT;
		}
		else
		{
			return LANE.RIGHT;
		}
	}
	else if (verticalDirection != 0)
	{
		if (verticalDirection == -1)
		{
			return LANE.UP;
		}
		else
		{
			return LANE.DOWN;
		}
	}
}