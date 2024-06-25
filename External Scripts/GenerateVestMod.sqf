_vests = "getText (_x >> 'ItemInfo' >> '_generalMacro') == 'VestItem'" configClasses (configFile >> "CfgWeapons");

fnf_addonsToGoAfter = [];
fnf_problemVests = [];

fnf_searchVest = {
	params["_vest", "_forcedToAdd"];
	_hitpointsChanged = false;

	_heirarchy = configHierarchy (_vest >> "ItemInfo" >> "HitpointsProtectionInfo");
	if (_heirarchy find _vest isNotEqualTo -1) then
	{
		_hitpointsChanged = true;
	};

	if ((configName (inheritsFrom _vest)) isEqualTo "Vest_Camo_Base" or (configName (inheritsFrom _vest)) isEqualTo "Vest_NoCamo_Base" or (configName (inheritsFrom _vest)) isEqualTo "V_LIB_Vest_Camo_Base") then
	{
		_hitpointsChanged = true;
	};

	if (_hitpointsChanged isEqualTo false and not _forcedToAdd) exitWith {};

	_vestEntry = fnf_problemVests findif {_x select 0 isEqualTo (configName (inheritsFrom _vest))};

	if ((configName _vest isEqualTo "Vest_Camo_Base") or (configName _vest isEqualTo "Vest_NoCamo_Base") or (configName _vest isEqualTo "V_LIB_Vest_Camo_Base")) then
	{
		fnf_problemVests pushBackUnique [configName _vest, ""];
		continue;
	};

	fnf_problemVests pushBackUnique [configName _vest, configName (inheritsFrom _vest)];

	if (_vestEntry == -1) then
	{
		[(inheritsFrom _vest), true] call fnf_searchVest;
	};
	_addons = (configSourceAddonList _vest);
	{
		fnf_addonsToGoAfter pushBackUnique _x;
	} forEach _addons

};

{
	[_x, false] call fnf_searchVest;
} forEach _vests;

fnf_output = ["class CfgPatches
{
	class fnf_armor
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"];

{
	fnf_output pushBack ("'" + _x + "'");
	fnf_output pushBack ",";
} forEach fnf_addonsToGoAfter;

fnf_output set [(count fnf_output) - 1, "};"];



fnf_output pushBack "	};
};
class ItemInfo;
class cfgWeapons
{
	";

fnf_pushedVests = [];

fnf_addVest = {
	params["_vest"];
	if ((_vest select 0) in fnf_pushedVests) exitWith {};
	if ((_vest select 1) in fnf_pushedVests) then
	{
		fnf_output pushBack ("	class " + (_vest select 0) + ": " + (_vest select 1) + "
	{
		class ItemInfo: ItemInfo
		{
			class HitpointsProtectionInfo
			{
				class Neck
				{
					hitpointName = 'HitNeck';
					armor = 0;
					passThrough = 0.5;
				};
				class Chest
				{
					hitpointName = 'HitChest';
					armor = 15;
					passThrough = 0.1;
				};
				class Diaphragm
				{
					hitpointName = 'HitDiaphragm';
					armor = 15;
					passThrough = 0.1;
				};
				class Abdomen
				{
					hitpointName = 'HitAbdomen';
					armor = 15;
					passThrough = 0.1;
				};
				class Pelvis
				{
					hitpointName = 'HitPelvis';
					armor = 0;
					passThrough = 0.1;
				};
				class Body
				{
					hitpointName = 'HitBody';
					armor = 0;
					passThrough = 0.1;
				};
				class Arms
				{
					hitpointName = 'HitArms';
					armor = 0;
					passThrough = 0.5;
				};
			};
		};
	};
");
		fnf_pushedVests pushBack (_vest select 0);
	} else {
		_vestEntry = fnf_problemVests findif {_x select 0 isEqualTo (_vest select 1)};
		if (_vestEntry != -1) then
		{
			[fnf_problemVests select _vestEntry] call fnf_addVest;
		};
		fnf_output pushBack ("	class " + (_vest select 0) + ": " + (_vest select 1) + "
	{
		class ItemInfo: ItemInfo
		{
			class HitpointsProtectionInfo
			{
				class Neck
				{
					hitpointName = 'HitNeck';
					armor = 0;
					passThrough = 0.5;
				};
				class Chest
				{
					hitpointName = 'HitChest';
					armor = 15;
					passThrough = 0.1;
				};
				class Diaphragm
				{
					hitpointName = 'HitDiaphragm';
					armor = 15;
					passThrough = 0.1;
				};
				class Abdomen
				{
					hitpointName = 'HitAbdomen';
					armor = 15;
					passThrough = 0.1;
				};
				class Pelvis
				{
					hitpointName = 'HitPelvis';
					armor = 0;
					passThrough = 0.1;
				};
				class Body
				{
					hitpointName = 'HitBody';
					armor = 0;
					passThrough = 0.1;
				};
				class Arms
				{
					hitpointName = 'HitArms';
					armor = 0;
					passThrough = 0.5;
				};
			};
		};
	};
");
		fnf_pushedVests pushBack (_vest select 0);
	};
};

{
	[_x] call fnf_addVest;
} forEach fnf_problemVests;
fnf_output pushBack "};";
fnf_output joinString "";
