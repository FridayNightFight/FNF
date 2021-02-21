call phx_fnc_disableMisc;
call phx_fnc_zoneBoundary;
call phx_fnc_startBoundary;
call phx_fnc_restrictGamma;

//Uniform and etool restrictions
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_fnc_restrictUniform; call phx_fnc_restrictETool;}] call CBA_fnc_waitUntilAndExecute;

//[{!phx_safetyEnabled && !isNull (findDisplay 46)}, {call phx_fnc_afkCheck}] call CBA_fnc_waitUntilAndExecute;

//Set TFAR volume to whisper
5 call TFAR_fnc_setVoiceVolume;
TF_speak_volume_level = "whispering";

//View distance and terrain grid force
[{
  if (viewDistance > phx_maxViewDistance) then {
    setViewDistance phx_maxViewDistance;
  };
  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };
} , 1] call CBA_fnc_addPerFrameHandler;

//Hide server chat messages (connect, disconnect, etc.)
phx_hideServerChatEH = addMissionEventHandler ["HandleChatMessage", {
  params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];

  private _msg = ["connecting", "connected", "disconnected", "modified data", "timed out", "authentication failed"];
  private _word = false;
  private _serv = false;

  if (_owner == 2 && !isServer) then {_serv = true};

  {
    if (_x in _text) then {_word = true};
  } forEach _msg;

  if (_word && _serv) then {true};
}];

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
