/*
	Author: Mallen

	Description:
		Used to overide ace re-arm functions with fnf defined functions

	Parameter(s):
		None

	Returns:
		None
*/

["All", "InitPost", {
  _vehicle = (_this select 0);

  if (!alive _vehicle) then {continue;};

  if (local _vehicle && {getAmmoCargo _vehicle > 0}) then {
    _vehicle setAmmoCargo 0;
  };

  _configOf = configOf _vehicle;

  _isSupplyVehicle = _vehicle getVariable ["ace_rearm_isSupplyVehicle", false];

  _configSupply = getNumber (_configOf >> "ace_rearm_defaultSupply");
  if (_configSupply == 0) then {
    _configSupply = getNumber (_configOf >> "transportAmmo");
  };

  if (not _isSupplyVehicle && (_configSupply <= 0)) then {continue;};

  _addRearmActions = {};

  _actionTakeAmmo = [
    "fnf_rearm_takeAmmo",
    localize "STR_ACE_rearm_Rearm",
    "\z\ace\addons\rearm\ui\icon_rearm_interact.paa",
    {},
    {
      params ["_truck", "_unit"];
      (alive _unit)
      && {alive _truck}
      && {(_truck distance _unit) < 9}
      && {isNull (_unit getVariable ["ace_rearm_dummy", objNull])}
      && {[_unit, _truck, ["IsNotInside"]] call ace_common_fnc_canInteractWith;}; // manually added actions need this
    },
    {
      _this call FNF_ClientSide_fnc_addRearmActions;
    }
  ] call ace_interact_menu_fnc_createAction;

  [_vehicle, 0, ["ACE_MainActions"], _actionTakeAmmo] call ace_interact_menu_fnc_addActionToObject;
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;
