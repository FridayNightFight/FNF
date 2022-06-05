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

  //Remove HE magazines from vehicles
  if (phx_removeHE) then {
    //Simply checks the magazine class names for "he" in the name. Seems a bit more reliable than reading from config
    _isExp = {
      _magClass = _this;
      _magClass = toLower _magClass;
      //getNumber (configFile  >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> _magClass >> "ammo")) >> "explosive") >= 0.4
      "he" in _magClass && !("heat" in _magClass)
    };

    if ("mortar" in toLower (typeOf _vic)) exitWith {}; //Exit if vehicle is mortar

    _mags = magazines _vic;
    _heMags = _mags select {_x call _isExp};

    {
      _vic removeMagazine _x;
    } forEach _heMags;
  };

  //Apply auto-takeoff script to unlocked air vehicles
  if (_vic isKindOf "Air" && (locked _vic == 0 || locked _vic == 1) && !("parachute" in toLower (typeOf _vic))) then {
    [_vic] remoteExec ["phx_fnc_autoTakeoff",[east,west,independent],true];
  };
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;
