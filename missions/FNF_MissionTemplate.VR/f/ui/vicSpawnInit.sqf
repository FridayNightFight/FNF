_veh = _this;
_class = typeOf _veh;

_veh allowDamage false;

clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
_veh addItemCargoGlobal ["Toolkit", 1];

switch (_class) do {
  case "RHS_MELB_AH6M": {
    _veh removeWeaponTurret ["rhs_weap_FFARLauncher", [-1]];
    [_veh,{
      _this setPylonLoadout ["pylon1", ""];
      _this setPylonLoadout ["pylon4", ""];
    }] remoteExec ["BIS_fnc_call", 0, true];
  }
};
