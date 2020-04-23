waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};
sleep 0.5;

if (phx_loadout_unitLevel > 0) then {
  switch (playerSide) do {
    case east: {
      player addItem "ACE_key_east";
    };
    case west: {
      player addItem "ACE_key_west";
    };
    case independent: {
      player addItem "ACE_key_indp";
    };
  };
};

if !(pRole == 14 || pRole == 15) exitWith {};

private _vic = objNull;
switch (pRole) do {
  case 14: {
    _vic = position player nearestObject "Air";
  };
  case 15: {
    _vic = position player nearestObject "LandVehicle";
  };
};

if !(isNull _vic) then {
  [player, _vic, true] call ace_vehiclelock_fnc_addKeyForVehicle;
};
