[phx_iconHandle] call CBA_fnc_removePerFrameHandler;

phx_LoadoutChosen = false;

call PHX_fnc_roles;
call phx_fnc_safety;

[{time > 0}, {call phx_fnc_restrictions; call phx_fnc_checkLoadout;}] call CBA_fnc_waitUntilAndExecute;