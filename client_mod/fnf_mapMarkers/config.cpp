class CfgPatches
{
	class fnf_mapMarkers
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F"};
	};
};

class CfgMarkers {
	class Flag;
	class fnf_sjtf : Flag
	{
		scope = 1;
		markerClass = "Flags";
		name = "SJTF Flag";
		icon = "fnf_mapMarkers\images\markers_sjtf.paa";
		texture = "fnf_mapMarkers\images\markers_sjtf.paa";
		color[] = { 1, 1, 1, 1 };
		shadow = 1;
		size = 128;
	};
	class fnf_efec : Flag
	{
		scope = 1;
		markerClass = "Flags";
		name = "EFEC Flag";
		icon = "fnf_mapMarkers\images\markers_efec.paa";
		texture = "fnf_mapMarkers\images\markers_efec.paa";
		color[] = { 1, 1, 1, 1 };
		shadow = 1;
		size = 128;
	};
};
