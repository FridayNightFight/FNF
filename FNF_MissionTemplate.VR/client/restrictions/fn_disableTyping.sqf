/*
Disables typing in global, side and spectator chat if player is not staff
*/

[{!isNil "fnf_staffInfo"}, {
  if ((getPlayerUID player) in fnf_staffInfo) then {
    0 enableChannel true; //Make sure global is enabled if admin
  } else {
    0 enableChannel false;

    //Disable chat typing if channel is side
    [{
      params ["_display","_handle"];
      if (!isNull (findDisplay _display)) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        phx_sideChatRestrict = (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat' && currentChannel == 1) then { true } else { false };"];
      };
    }, 1, 46] call CBA_fnc_addPerFrameHandler; //Mission display

    [{
      params ["_display","_handle"];
      if (!isNull (findDisplay _display)) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        phx_spectatorChatRestrict = (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
      };
    }, 1, 60000] call CBA_fnc_addPerFrameHandler; //ACE spectator display
  };
}] call CBA_fnc_waitUntilAndExecute;
