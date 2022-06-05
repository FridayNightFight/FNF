// Clear vehicle inventories
["All", "InitPost", {
  private _vic = (_this select 0);
  if (_vic isKindOf "Man" || typeOf _vic == "WeaponHolderSimulated") exitWith {}; //Exit so the code below doesn't run for infantry units

  if (_vic getVariable ["fnf_clearInventory", true]) then {
    clearBackpackCargoGlobal _vic;
    clearWeaponCargoGlobal _vic;
    clearItemCargoGlobal _vic;
    clearMagazineCargoGlobal _vic;
  };
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;
