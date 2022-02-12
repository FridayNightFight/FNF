if !(fnf_gameMode == "sustainedAssault") exitWith {};

fnf_safeZone_fnc_stopVehicle = {
  params [["_object",objNull]];
  if (isTouchingGround _object) then {
    _object setVectorUp (surfaceNormal (position _object));
  } else {
    _object setVectorUp [0,0,1];
  };
  _object setVelocity [0,0,0];
};

fnf_safeZone_fnc_moveOutside = {
  params [["_object",objNull]];
  if (fnf_restrictEntry_lastGoodPos select 2 > 0.2) then {
    _object setpos fnf_restrictEntry_lastGoodPos;
  } else {
    _object setpos (fnf_restrictEntry_lastGoodPos findEmptyPosition [0, 50, typeOf _object]);
  };

  ["<t align='center'><t color='#FF3333'>You're too close to the enemy's entry point!!</t>", "warning", 5] call fnf_ui_fnc_notify;
};


// disable moving into restricted zones that belong to other sides

if (!isNil "fnf_restrictions_handle_restrictedZones") then {
  [fnf_restrictions_handle_restrictedZones] call CBA_fnc_removePerFrameHandler;
  fnf_restrictions_handle_restrictedZones = nil;
};

fnf_restrictions_handle_restrictedZones = [{
  _args params ["_maxTime"];
  private _vic = vehicle player;
  if (isTouchingGround _vic) then {
    if !([_vic, playerSide] call fnf_fnc_inRestrictedZone) then {
      fnf_restrictEntry_lastGoodPos = getpos _vic;
    } else {
      [_vic] call fnf_safeZone_fnc_stopVehicle;
      [_vic] call fnf_safeZone_fnc_moveOutside;
    };
  };
}, 2, [2]] call CBA_fnc_addPerFrameHandler;
