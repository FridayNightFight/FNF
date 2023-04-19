/*
	Author: Mallen

	Description:
		Picks which gamemode should be loaded and played

	Parameter(s):
		None

	Returns:
		None
*/
switch (fnf_gameMode) do
{
	case "Destroy": {call FNF_Config_fnc_destroyConfig};
	default { hint "Warning, Gamemode not set correctly, mission will not function correctly" };
}