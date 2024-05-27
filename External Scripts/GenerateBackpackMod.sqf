_backpacks = "getNumber (_x >> 'isbackpack') == 1" configClasses (configFile >> "CfgVehicles");

fnf_addonsToGoAfter = [];

fnf_problemBackpacks = [];

fnf_searchBackpack = {
	params["_backpack", "_forced"];
	_properties = configProperties [_backpack, "true", false];
	_maxLoadFound = false;
	{
		if (configName _x isEqualTo "maximumLoad") then
		{
			_maxLoadFound = true;
		};
	} forEach _properties;

	if (getNumber (_backpack >> 'maximumLoad') isEqualTo 0) then
	{
		_maxLoadFound = false;
	};

	if (_forced) then
	{
		_maxLoadFound = true;
	};

	if (_maxLoadFound) then
	{
		_backpackEntry = fnf_problemBackpacks findif {_x select 0 isEqualTo (configName (inheritsFrom _backpack))};

		if (configName _backpack isEqualTo "Bag_Base") then
		{
			fnf_problemBackpacks pushBackUnique [configName _backpack, ""];
			continue;
		};

		fnf_problemBackpacks pushBackUnique [configName _backpack, configName (inheritsFrom _backpack)];

		if (_backpackEntry == -1) then
		{
			[(inheritsFrom _backpack), true] call fnf_searchBackpack;
		};
		_addons = (configSourceAddonList _backpack);
		{
			fnf_addonsToGoAfter pushBackUnique _x;
		} forEach _addons
	};
};

{
	[_x, false] call fnf_searchBackpack;
} forEach _backpacks;

fnf_output = ["class CfgPatches
{
	class fnf_backpacks
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
class cfgVehicles
{
	";

fnf_pushedBackPacks = [];

fnf_addBackpack = {
	params["_backpack"];
	if ((_backpack select 0) in fnf_pushedBackPacks) exitWith {};
	if ((_backpack select 1) in fnf_pushedBackPacks) then
	{
		fnf_output pushBack ("	class " + (_backpack select 0) + ": " + (_backpack select 1) + "
	{
		maximumLoad = 1000;
	};
");
		fnf_pushedBackPacks pushBack (_backpack select 0);
	} else {
		_backpackEntry = fnf_problemBackpacks findif {_x select 0 isEqualTo (_backpack select 1)};
		if (_backpackEntry != -1) then
		{
			[fnf_problemBackpacks select _backpackEntry] call fnf_addBackpack;
		};
		fnf_output pushBack ("	class " + (_backpack select 0) + ": " + (_backpack select 1) + "
	{
		maximumLoad = 1000;
	};
");
		fnf_pushedBackPacks pushBack (_backpack select 0);
	};
};

{
	[_x] call fnf_addBackpack;
} forEach fnf_problemBackpacks;
fnf_output pushBack "};";
fnf_output joinString "";
