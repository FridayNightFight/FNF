/*
Sets player as ACE spectator if not already.
Draws 3D icons on alive objectives.
*/

if (!(typeOf player == "ace_spectator_virtual") && !ace_spectator_isset) then {
  [true, true, true] call ace_spectator_fnc_setSpectator;
};

//Set camera focus to killer if they exist
private _lastDamage = player getVariable ["ace_medical_lastDamageSource",objNull];
if (!isNull _lastDamage) then {[2, _lastDamage] call ace_spectator_fnc_setCameraAttributes;};

//Set up objectives for 3d icon draws
phx_specObjectives = [];

if (!isNil "term1") then {phx_specObjectives pushBack term1};
if (!isNil "term2") then {phx_specObjectives pushBack term2};
if (!isNil "term3") then {phx_specObjectives pushBack term3};

if (!isNil "destroy_obj_1") then {phx_specObjectives pushBack destroy_obj_1};
if (!isNil "destroy_obj_2") then {phx_specObjectives pushBack destroy_obj_2};
if (!isNil "destroy_obj_3") then {phx_specObjectives pushBack destroy_obj_3};

if (!isNil "ctf_flag") then {phx_specObjectives pushBack ctf_flag};

call BIS_fnc_showMissionStatus; //show tickets etc. to spectators

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



disableSerialization;

[{!isNull findDisplay 60000}, {
  disableSerialization;
  _display = findDisplay 60000;

  _infoButton = _display ctrlCreate ["InfoPanelSpectatorButton", 2524];
  _infoButton ctrlAddEventHandler ["ButtonClick", {
    if (!dialog) then {
      [] spawn phx_ui_fnc_missionInfoPanel;
    };
  }];
}] call CBA_fnc_waitUntilAndExecute;


phx_spectatorVisiblePrevinput = true;
phx_spectatorPrevVisibleCtrls = [];

[{
  private _missionRuntimeSecs = (phx_missionTimelimit * 60) + phx_safetyEndTime;
  private _visible = ace_spectator_uiVisible;
  if (_visible != phx_spectatorVisiblePrevinput) then {
    phx_spectatorVisiblePrevinput = _visible;
    if !(_visible) then {
      showChat false;

      phx_spectatorPrevVisibleCtrls = [];
      {
        if (ctrlShown _x) then {
          _x ctrlShow false;
          phx_spectatorPrevVisibleCtrls append [_x];
        };
      } forEach allControls findDisplay 60000;

      showHUD [false,false,false,false,false,false,false,false,false,false,false];

      if ((_missionRuntimeSecs - (15 * 60)) <= CBA_missionTime) then {
      	[phx_missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
        uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
  		};
    } else {
      showChat true;

      {
        _x ctrlShow true;
      } forEach phx_spectatorPrevVisibleCtrls;

      showHUD [true,true,true,true,true,true,false,true,true,true,false];

      phx_spectatorPrevVisibleCtrls = [];

      if ((_missionRuntimeSecs - (15 * 60)) <= CBA_missionTime) then {
      	call phx_fnc_clientTime;
  		};
    };
  };
}] call CBA_fnc_addPerFrameHandler;
