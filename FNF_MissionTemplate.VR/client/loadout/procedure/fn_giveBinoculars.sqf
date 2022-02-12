/*
* Author: IndigoFox
*
* Description:
* Apply binoculars depending on role.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The role to evaluate (default: "BASE") <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, PLAYERLOADOUTVAR] call fnf_loadout_fnc_giveBinoculars
*
* Public: No
*/


// Give binocular items
params [
  ["_unit", objNull],
  ["_role", "BASE"]
];

if (isNull _unit) exitWith {nil};

private _binocs = (missionConfigFile >> "CfgLoadouts" >> "common" >> "binoculars");

private _hasBinoc = (((assigneditems _unit) findIf {getText(configFile >> "CfgWeapons" >> _x >> "simulation") == "Binocular"}) > -1);
if (_hasBinoc) exitWith {true};

private _binocRolesStandard = ["ARA", "MGA", "CR"];
private _binocRolesRangefinder = ["TL", "MATA1", "MATA2"];
private _binocRolesVector = ["SL", "SGT", "PL", "CRL"];
private "_thisBinoc";

if (
  mySideGearSelection select [0,2] isEqualTo "VN" &&
  _role in flatten([_binocRolesStandard,_binocRolesRangefinder,_binocRolesVector])
) then {
  // Vietnam should receive reg binocs only
  _thisBinoc = "vn_mk21_binocs";
} else {
  // Modern should receive differing types
  if (_role in _binocRolesStandard) then {
    _thisBinoc = getText(_binocs >> "standard");
  };
  if (_role in _binocRolesRangefinder) then {
    _thisBinoc = getText(_binocs >> "rangefinder");
  };
  if (_role in _binocRolesVector) then {
    _thisBinoc = getText(_binocs >> "vector21");
  };
};

if (!isNil "_thisBinoc") then {
  _unit addWeapon _thisBinoc;
  diag_log text format["[FNF] (loadout) INFO: Equipped binoculars ""%1""", _thisBinoc];
};

true
