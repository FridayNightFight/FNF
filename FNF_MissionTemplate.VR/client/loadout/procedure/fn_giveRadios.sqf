/*
* Author: IndigoFox
*
* Description:
* Reads radio settings from loadout config and removes existing or replaces with placeholder.
* Uses radios defined as side defaults by TFAR.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: If unit should receive a SW radio (default TRUE) <BOOLEAN>
* 2: If unit should receive a LR radio (default FALSE) <BOOLEAN>
*
* Return Value:
* true on success <BOOLEAN>
* nil on fail <NIL>
*
* Example:
* [player, _cfgGiveSRRadio, _cfgGiveLRRadio] call fnf_loadout_fnc_giveRadios
*
* Public: Yes
*/

// Radios
params [["_unit", objNull], ["_srRadio", true], ["_lrRadio", false]];

if (isNull _unit) exitWith {nil};

private _swRadioForAll = missionNamespace getVariable ["fnf_SWRadioForAll", -1];

if ((_srRadio || _swRadioForAll == 1) && !(_swRadioForAll == 0)) then {
  _unit linkItem ([side (group _unit), 1] call TFAR_fnc_getSideRadio);
  diag_log text format["[FNF] (loadout) INFO: Equipped SW radio ""%1""", [side (group _unit), 1] call TFAR_fnc_getSideRadio];
  // missionNamespace setVariable ["fnf_hasSW", true];
} else {
  if (call TFAR_fnc_haveSWRadio) then {
    player unlinkItem (call TFAR_fnc_activeSwRadio);
    diag_log text format["[FNF] (loadout) INFO: Removed SW radio (loadout says this role shouldn't receive one)"];
  };
  // missionNamespace setVariable ["fnf_hasSW", false];
};


if (_lrRadio) then {
  // Compensation: if a role is configured in Gear Set to have a LR radio but their backpack config isn't classified as one to TFAR, it will replace their backpack with a default stand-in. Similarly, if they have a radio-enabled backpack but shouldn't, it's replaced with a general tactical backpack.
  // This is to ensure leadership receives LR radios if they should, even if the loadout-assigned backpack isn't a radio
  private _backpack = backpack _unit;

  //Hardwired fix for Vietnam radios not being classed as LR radios by TFAR_fnc_isBackpackRadio
  //This is likely a config issue that should be fixed however desperate times etc
  _isLRRadioValid = false;
  _vnRadios = [
    "vn_b_pack_lw06",
    "vn_b_pack_prc77_01",
    "vn_b_pack_trp_04_02",
    "vn_b_pack_03_02",
    "vn_b_pack_03",
    "vn_b_pack_trp_04",
    "vn_o_pack_t884_01"
  ];
  if (_backpack call TFAR_fnc_isBackpackRadio) then {
    _isLRRadioValid = true;
  } else {
    {
      if (_backpack == _x) then {
        _isLRRadioValid = true;
      };
    } forEach _vnRadios
  };

  if (_isLRRadioValid) then {
    private _items = backpackItems _unit;
    removeBackpack _unit;
    _unit addBackpack _backpack;
    {
      _unit addItemToBackpack _x;
    } forEach _items;
    diag_log text format["[FNF] (loadout) INFO: Equipped LR radio ""%1""", [side (group _unit), 0] call TFAR_fnc_getSideRadio];
  } else {
    private _items = backpackItems _unit;
    removeBackpack _unit;
    _unit addBackpack ([side (group _unit), 0] call TFAR_fnc_getSideRadio);
    {
      _unit addItemToBackpack _x;
    } forEach _items;
    diag_log text format["[FNF] (loadout) INFO: Equipped LR radio ""%1""", [side (group _unit), 0] call TFAR_fnc_getSideRadio];
  };
  // missionNamespace setVariable ["fnf_hasLR", true];
} else {
  if (call TFAR_fnc_haveLRRadio) then {
    private _items = backpackItems _unit;
    removeBackpack _unit;
    _unit addBackpack "B_TacticalPack_blk";
    {
      _unit addItemToBackpack _x;
    } forEach _items;
    diag_log text format["[FNF] (loadout) INFO: Removed LR radio (loadout says this role shouldn't receive one)"];
  };
  // missionNamespace setVariable ["fnf_hasLR", false];
};
true
