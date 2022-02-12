/*
Disables typing in global, side and spectator chat if player is not staff
*/

[{!isNil "fnf_staffInfo"}, {
  if ((getPlayerUID player) in fnf_staffInfo) then {
    0 enableChannel true; //Make sure global is enabled if admin
  } else {
    0 enableChannel false;

    //Disable chat typing if channel is side
    if (!isNil "fnf_restrictions_handle_typingMission") then {
      [fnf_restrictions_handle_typingMission] call CBA_fnc_removePerFrameHandler;
      fnf_restrictions_handle_typingMission = nil;
    };
    fnf_restrictions_handle_typingMission = [{
      params ["_display","_handle"];
      if (!isNull (findDisplay _display)) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        fnf_sideChatRestrict = (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat' && currentChannel == 1) then { true } else { false };"];
      };
    }, 1, 46] call CBA_fnc_addPerFrameHandler; //Mission display

    if (!isNil "fnf_restrictions_handle_typingSpectator") then {
      [fnf_restrictions_handle_typingSpectator] call CBA_fnc_removePerFrameHandler;
      fnf_restrictions_handle_typingSpectator = nil;
    };
    fnf_restrictions_handle_typingSpectator = [{
      params ["_display","_handle"];
      if (!isNull (findDisplay _display)) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        fnf_spectatorChatRestrict = (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
      };
    }, 1, 60000] call CBA_fnc_addPerFrameHandler; //ACE spectator display
  };
}] call CBA_fnc_waitUntilAndExecute;
