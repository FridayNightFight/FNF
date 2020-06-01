player unassignItem "ItemRadio";
player removeItem "ItemRadio";

waitUntil {!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"};
call phx_fnc_clientInit;
