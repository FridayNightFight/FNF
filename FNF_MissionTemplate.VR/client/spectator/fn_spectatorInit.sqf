/*
Sets player as ACE spectator if not already.
Draws 3D icons on alive objectives.
*/

if (!(typeOf player == "ace_spectator_virtual") && !ace_spectator_isset) then {
  [true, true, true] call ace_spectator_fnc_setSpectator;
};

//Set up objectives for 3d icon draws
phx_specObjectives = [];

if (!isNil "term1") then {phx_specObjectives pushBack term1};
if (!isNil "term2") then {phx_specObjectives pushBack term2};
if (!isNil "term3") then {phx_specObjectives pushBack term3};

if (!isNil "destroy_obj1") then {phx_specObjectives pushBack destroy_obj1};
if (!isNil "destroy_obj2") then {phx_specObjectives pushBack destroy_obj2};
if (!isNil "destroy_obj3") then {phx_specObjectives pushBack destroy_obj3};

if (!isNil "ctf_flag") then {phx_specObjectives pushBack ctf_flag};

call BIS_fnc_showMissionStatus; //show tickets etc. to spectators

//Wait for ACE spectator display and disable typing
[{!isNull findDisplay 60000}, {60000 call phx_fnc_disableTyping}] call CBA_fnc_waitUntilAndExecute;

//Returns true if obj can be drawn
phx_iconHandle = [{
  drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL term1, 0.6, 0.6, 45];
} , 0, []] call CBA_fnc_addPerFrameHandler;



if (serverCommandAvailable "#kick") then {
  [{!isNull findDisplay 60000}, {
    call PHX_fnc_adminGUI;
    if !(phx_keyDownEHId == -1) then {
      findDisplay 60000 displayRemoveEventHandler ["KeyDown", phx_keyDownEHId];
    };
    phx_keyDownEHId = findDisplay 60000 displayAddEventHandler ["KeyDown", {
      _keyPressed = _this select 1;
      if (_keyPressed == 23) then {
        if (phx_adminGUI isEqualTo displayNull) then {
		      call PHX_fnc_adminGUI;
	      };
      };
    }];
  }] call CBA_fnc_waitUntilAndExecute;
};



//Draw 3d icons for objectives
//{
//  if (_x call _showObj) then {
//    [{
//      params ["_obj"];
//      if (isNull _obj || !alive _obj) then {
//        [_handle] call CBA_fnc_removePerFrameHandler;
//      } else {
//        drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _obj, 0.6, 0.6, 45];
//      };
//    } , 0, _x] call CBA_fnc_addPerFrameHandler;
//  };
//} forEach phx_specObjectives;
