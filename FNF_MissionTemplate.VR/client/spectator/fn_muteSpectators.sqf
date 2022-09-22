if (!ace_spectator_isSet) exitWith {};

private _aceSpectator = findDisplay 60000;
fnf_spectatorMute = false;
fnf_spectatorMute_nextChange = 0;

fnf_spectatorMute_fnc_enable = {
  //Continuously mute all spectators while active
  fnf_spectatorMutePFH = [{
    if (alive player || !ace_spectator_isSet) exitWith {call fnf_spectatorMute_fnc_disable};

    {_x setVariable ["tf_voiceVolume", 0.0]} forEach (call ace_spectator_fnc_players);
  },0.25] call CBA_fnc_addPerFrameHandler;

  _player = call TFAR_fnc_currentUnit;
  _player setVariable ["tf_voiceVolume", 0.0, true];
  systemChat "Muted Spectators";
};

fnf_spectatorMute_fnc_disable = {
  [fnf_spectatorMutePFH] call CBA_fnc_removePerFrameHandler;
  {_x setVariable ["tf_voiceVolume", 1.0]} forEach (call ace_spectator_fnc_players);

  _player = call TFAR_fnc_currentUnit;
  _player setVariable ["tf_voiceVolume", 1.0, true];
  systemChat "Unmuted Spectators";
};

fnf_spectator_mute_keydownEH = _aceSpectator displayAddEventHandler ["KeyDown", {
  params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];

  _spectator_mute_keybind = (["Friday Night Fight", "fnf_key_spectatorMute"] call CBA_fnc_getKeybind) select 5 select 0;
  if (isNil "_spectator_mute_keybind") then {_spectator_mute_keybind = 27}; //']'

  if (_key == _spectator_mute_keybind) then {
    if (diag_tickTime < fnf_spectatorMute_nextChange) exitWith {systemChat "You must wait to change voice mode"};
    fnf_spectatorMute_nextChange = diag_tickTime + 5;

    if (!fnf_spectatorMute) then {call fnf_spectatorMute_fnc_enable};
    if (fnf_spectatorMute) then {call fnf_spectatorMute_fnc_disable};

    fnf_spectatorMute = !fnf_spectatorMute;
  };
}];
