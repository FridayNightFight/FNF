call phx_fnc_disableMisc;

call phx_fnc_zoneBoundary;

call phx_fnc_startBoundary;

call phx_fnc_restrictUniform;

call phx_fnc_restrictGamma;

[] spawn phx_fnc_afkCheck;

//Set TFAR volume to whisper
5 call TFAR_fnc_setVoiceVolume;
TF_speak_volume_level = "whispering";

//View distance and terrain grid force
[{
  if ((getObjectViewDistance select 0) > phx_maxViewDistance) then {
    setObjectViewDistance phx_maxViewDistance;
  };
  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };
} , 1] call CBA_fnc_addPerFrameHandler;

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
