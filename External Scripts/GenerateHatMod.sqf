_hats = "getText (_x >> 'ItemInfo' >> '_generalMacro') == 'HeadgearItem'" configClasses (configFile >> "CfgWeapons");

fnf_addonsToGoAfter = [];
fnf_problemHats = [];

fnf_searchHat = {
  params["_hat", "_forcedToAdd"];
  _hitpointsChanged = false;

  _heirarchy = configHierarchy (_hat >> "ItemInfo" >> "HitpointsProtectionInfo");
  if (_heirarchy find _hat isNotEqualTo -1) then
  {
    _hitpointsChanged = true;
  };

  if ((configName (inheritsFrom _hat)) isEqualTo "HelmetBase" or (configName (inheritsFrom _hat)) isEqualTo "H_HelmetB" or (configName (inheritsFrom _hat)) isEqualTo "ItemCore") then
  {
    _hitpointsChanged = true;
  };

  if (_hitpointsChanged isEqualTo false and not _forcedToAdd) exitWith {};

  _hatEntry = fnf_problemHats findif {_x select 0 isEqualTo (configName (inheritsFrom _hat))};

  if ((configName _hat isEqualTo "HelmetBase") or (configName _hat isEqualTo "H_HelmetB") or (configName _hat isEqualTo "ItemCore")) then
  {
    fnf_problemHats pushBackUnique [configName _hat, ""];
    continue;
  };

  fnf_problemHats pushBackUnique [configName _hat, configName (inheritsFrom _hat)];

  if (_hatEntry == -1) then
  {
    [(inheritsFrom _hat), true] call fnf_searchHat;
  };
  _addons = (configSourceAddonList _hat);
  {
    fnf_addonsToGoAfter pushBackUnique _x;
  } forEach _addons

};

{
  [_x, false] call fnf_searchHat;
} forEach _hats;

fnf_output = ["class CfgPatches
{
	class fnf_hats
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

fnf_pushedHats = [];

fnf_calledNumber = 0;

fnf_addHat = {
  params["_hat"];
  if ((_hat select 0) in fnf_pushedHats) exitWith {};
  if ((_hat select 1) in fnf_pushedHats or (_hat select 1) isEqualTo "") then
  {
    fnf_output pushBack ("	class " + (_hat select 0) + ": " + (_hat select 1) + "
	{
		class ItemInfo: ItemInfo
		{
			class HitpointsProtectionInfo
			{
				class Head
			  {
				  hitpointName = 'HitHead';
				  armor = 4;
				  passThrough = 0.5;
			  };
        class Face
			  {
				  hitpointName = 'HitFace';
				  armor = 4;
				  passThrough = 0.5;
			  };
			};
		};
	};
");
    fnf_pushedHats pushBack (_hat select 0);
  } else {
    _hatEntry = fnf_problemHats findif {_x select 0 isEqualTo (_hat select 1)};
    if (_hatEntry != -1) then
    {
      [fnf_problemHats select _hatEntry] call fnf_addHat;
    };
    fnf_output pushBack ("	class " + (_hat select 0) + ": " + (_hat select 1) + "
	{
		class ItemInfo: ItemInfo
		{
			class HitpointsProtectionInfo
			{
				class Head
			  {
				  hitpointName = 'HitHead';
				  armor = 4;
				  passThrough = 0.5;
			  };
        class Face
			  {
				  hitpointName = 'HitFace';
				  armor = 4;
				  passThrough = 0.5;
			  };
			};
		};
	};
");
    fnf_pushedHats pushBack (_hat select 0);
  };
};

{
  [_x] call fnf_addHat;
} forEach fnf_problemHats;
fnf_output pushBack "};";
fnf_output joinString "";

