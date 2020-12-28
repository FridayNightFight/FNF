waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};
sleep 0.5;

_giveKeys = {
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

if (isNil "phx_loadout_unitLevel") then {
  call _giveKeys;
} else {
  if (phx_loadout_unitLevel > 0) then {
    call _giveKeys;
  };
};

_vics = synchronizedObjects player;
if (!isNil "_vics") then {
  {[player, _x, true] call ace_vehiclelock_fnc_addKeyForVehicle;} forEach _vics;
};
