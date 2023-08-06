class CfgPatches
{
	class fnf_sounds
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgSounds
{
	class fnf_bomb_alarm
	{
		name = "fnf_bomb_alarm";
		sound[] = {"fnf_sounds\sounds\bomb_alarm.ogg", 2.5, 1};
		titles[] = {1, ""};
	};
};
