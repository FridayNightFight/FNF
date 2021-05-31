/*Gives the player NVGs if set in the mission config*/

private _hasNVG = false;

switch (true) do {
  case (phx_addNVG isEqualTo true || phx_playerSide isEqualTo phx_addNVG): {_hasNVG = true};
  case (typeName phx_addNVG == "ARRAY"): {if (phx_playerSide in phx_addNVG) then {_hasNVG = true}};
};

_giveNVG = {player linkItem phx_loadout_nvg};
_addLaser = {{player addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];};

if (_hasNVG) then {call _giveNVG; call _addLaser};
