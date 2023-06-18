/*
* Author: IndigoFox
*
* Description:
* Give secondary weapon from config.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Config value, whether the unit should receive a silencer <NUMBER>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, getNumber(CFGGEAR >> "giveSilencer")] call fnf_loadout_fnc_giveSilencer
*
* Public: No
*/

params [
  ["_unit", objNull],
  ["_giveSilencer", 0]
];

if (isNull _unit) exitWith {nil};

if (_giveSilencer > 0 && !isNil "fnf_loadout_weapon") then {
  _muzzleAcc = [fnf_loadout_weapon, "muzzle"] call CBA_fnc_compatibleItems;
  _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
  if (count _silencers > 0) then {
    _unit addPrimaryWeaponItem (_silencers select 0);
    diag_log text format["[FNF] (loadout) INFO: Equipped silencer ""%1""", _silencers # 0];
  } else {
    diag_log text format["[FNF] (loadout) WARNING: Tried to equip silencer, but none compatible with ""%1""", fnf_loadout_weapon];
  };
};
true
