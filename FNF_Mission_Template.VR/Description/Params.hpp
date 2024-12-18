class Params
{
	class PerformanceTweaks
	{
		// Visible name in lobby settings list
		title = "Performance Tweaks";

		// must be integers - commas e.g 1.5 are not allowed
		values[] = { 0, 1, 2, 3 };

		// Description of each selectable item - must have the same number of items as 'values'
		// If texts are missing, the values will be displayed instead
		texts[] = { "None", "Low", "Medium", "High"};

		// must be listed in 'values' array, otherwise 0 is used. If not integer, fallback value is 1
		default = 0;
	};
};
