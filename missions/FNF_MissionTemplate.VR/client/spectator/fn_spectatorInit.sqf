phx_specEnabled = true;

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
waitUntil {!isNull findDisplay 60000};

//Stop typing in chat if player is not logged-in admin
60000 call phx_fnc_disableTyping;

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
