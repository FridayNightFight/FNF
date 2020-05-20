//Init ACE spectator once player respawns
//To do: don't break things if player is killed while spectating (somehow)
[player, true] call TFAR_fnc_forceSpectator;
waitUntil {alive player};

//Join player to a dummy side so they don't show on map with QSIcons
if (playerSide != sideLogic) then {
  _dummySide = createGroup sideLogic;
  [player] joinSilent _dummySide;
};

//call ace spectator and make sure player is hidden
[true] call ace_spectator_fnc_setSpectator;
if !(isObjectHidden player) then {
  [player,true] remoteExec ["hideObject",0,true];
};
phx_specEnabled = true;
player enableSimulation false;
player allowDamage false;

//Set camera position to player camera position @ time of death if not nil
if (!isNil "phx_playerDeathPos") then {
  ace_spectator_camera setPos phx_playerDeathPos;
};

//Set up objectives for 3d icon draws
phx_specObjectives = [];

if (!isNil "term1") then {phx_specObjectives pushBack term1};
if (!isNil "term2") then {phx_specObjectives pushBack term2};
if (!isNil "term3") then {phx_specObjectives pushBack term3};

if (phx_gameMode == "destroy") then {
  waitUntil {!isNil "phx_destroyObjs"};
  phx_specObjectives = phx_specObjectives + phx_destroyObjs;
};

if (phx_gameMode == "captureTheFlag") then {
  phx_specObjectives pushBack ctf_flag;
};

//Wait for ACE spectator display
phx_specListenEnabled = true;
waitUntil {!isNull findDisplay 60000};
_specDisplay = findDisplay 60000;

//Stop typing in chat if player is not logged-in admin
if !(serverCommandAvailable "#kick") then {
  _specDisplay displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};

//Spectator listening - Key = ] (right bracket)
phx_specDisplayKeydownEH = _specDisplay displayAddEventHandler ["KeyDown", {
  params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
  if (_key == 27) then {
    if (isNil "phx_specNextVoiceChange" || {diag_tickTime > phx_specNextVoiceChange}) then {
      phx_specNextVoiceChange = diag_tickTime + 2;

      phx_specListenEnabled = !phx_specListenEnabled;

      if !(phx_specListenEnabled) then {
        [player, false] call TFAR_fnc_forceSpectator;
      } else {
        [player, true] call TFAR_fnc_forceSpectator;
      };

      if !(phx_specListenEnabled) then {
        player setVariable ["tf_voiceVolume", 0.0, true];
        player setVariable ["tf_unable_to_use_radio", true, true];

        phx_spectatorMovePFH = [{
          player setPos (position ace_spectator_camera);
          player setDir (getDir ace_spectator_camera);
        }, 0.5] call CBA_fnc_addPerFrameHandler;

        systemChat "Spectator listening enabled";
      } else {
        [phx_spectatorMovePFH] call CBA_fnc_removePerFrameHandler;
        player setVariable ["tf_unable_to_use_radio", false, true];
        player setVariable ["tf_voiceVolume", 1.0, true];
        player setPos [-1000,-1000,0];

        systemChat "Spectator listening disabled";
      };
      } else {
        systemChat "You must wait to change voice mode";
      };
  };
}];

//Returns true if obj can be drawn
_showObj = {
  params ["_obj"];
  false;

  if (!isNil "_obj") then {
    if (!isNull _obj) then {
      true;
    };
  };
};

//Draw 3d icons for objectives
{
  if (_x call _showObj) then {
    [{
      params ["_obj"];
      if (isNull _obj || !alive _obj) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
      } else {
        drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _obj, 0.6, 0.6, 45];
      };
    } , 0, _x] call CBA_fnc_addPerFrameHandler;
  };
} forEach phx_specObjectives;
