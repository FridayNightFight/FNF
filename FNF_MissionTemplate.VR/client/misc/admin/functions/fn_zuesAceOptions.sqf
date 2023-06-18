_actionGoToLastReport = [
  "Zeus_GoToLastReport",
  "Zoom to Last Admin Report",
  "\A3\ui_f\data\igui\cfg\simpleTasks\types\heal_ca.paa",
  {
    [] spawn {
      (missionNamespace getVariable ["fnf_lastAdminReporter", [objNull, [0,0,0]]]) params ["_player", "_pos"];
      if (!isNull _player && !(_player in ([] call ace_spectator_fnc_players))) then {
        [
          ((_player getPos [50, 180]) vectorAdd [0,0,30]),
          _player,
          true
        ] spawn BIS_fnc_setCuratorCamera;
      } else {
        if (_pos isEqualTo [0,0,0]) exitWith {
          ["Last Player Report", "Player/location not saved. Have any reports been sent?", 5] call BIS_fnc_curatorHint;
        };
        [
          ((_pos getPos [50, 180]) vectorAdd [0,0,30]),
          _pos,
          true
        ] spawn BIS_fnc_setCuratorCamera;
      };
    };
  },
  {true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _actionGoToLastReport] call ace_interact_menu_fnc_addActionToZeus;


_actionSpawnAvatar = [
  "Zeus_SpawnAvatar",
  "Spawn Avatar",
  "",
  {
    _group = createGroup [civilian, true];
    [_group, ["Admin Avatar"]] remoteExec ["setGroupId"];
    fnf_zues_avatar = _group createUnit ["C_Soldier_VR_F", (screenToWorld [0.5, 0.5]), [], 0, "NONE"];
    _player_Name = name player;
    [fnf_zues_avatar, _player_Name] remoteExec ["setName"];
    fnf_zues_avatar allowDamage false;
    fnf_zues_avatar linkItem "NVGoggles";
    fnf_zues_avatar linkItem "ItemMap";
    fnf_zues_avatar forceAddUniform "U_C_Protagonist_VR";
    fnf_zues_avatar addMagazine "30Rnd_65x39_caseless_mag";
    fnf_zues_avatar addWeapon "arifle_MX_F";
    removeUniform fnf_zues_avatar;

    if (!isnull curatorcamera) then {

	    //--- Terminate when remote control is already in progress
	    if !(isnull (missionnamespace getvariable ["bis_fnc_moduleRemoteControl_unit",objnull])) exitwith {};

	    //--- Get unit
	    _unit = fnf_zues_avatar;

    	//--- Temp owner
    	private _tempOwner = _unit getvariable ["bis_fnc_moduleRemoteControl_owner", objnull];

   		_unit spawn {
    		scriptname "bis_fnc_moduleRemoteControl: Loop";
    		_unit = _this;
   			_vehicle = vehicle _unit;
   			_vehicleRole = str assignedvehiclerole _unit;

    		bis_fnc_moduleRemoteControl_unit = _unit;
    		_unit setvariable ["bis_fnc_moduleRemoteControl_owner",player,true];

	    	//--- Wait for interface to close
	    	(finddisplay 312) closedisplay 2;
    		waituntil {isnull curatorcamera};

    		//--- Switch
    		player remotecontrol _unit;
    		if (cameraon != _vehicle) then {
    			_vehicle switchcamera cameraview;
    		};

    		_curator = getassignedcuratorlogic player;
    		[_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,true]] call bis_fnc_callScriptedEventHandler;
    		[["Curator","RemoteControl"],nil,nil,nil,nil,nil,nil,true] call bis_fnc_advHint;

	    	//--- Back to player
    		_vehicle = vehicle _unit;
    		_vehicleRole = str assignedvehiclerole _unit;
    		_rating = rating player;
    		waituntil {
    			//--- Refresh when vehicle or vehicle role changes
    			if ((vehicle _unit != _vehicle || str assignedvehiclerole _unit != _vehicleRole) && {alive _unit}) then {
    				player remotecontrol _unit;
    				_vehicle = vehicle _unit;
    				_vehicleRole = str assignedvehiclerole _unit;
    			};
    			if (rating player < _rating) then {
    				player addrating (-rating player + _rating);
	    		};
	    		sleep 0.01;
	    		!isnull curatorcamera
	    		||
	    		{cameraon == vehicle player}
	    		||
    			{!alive _unit} //--- Also isnull check, objNull is not alive
	    		||
	    		{!alive player}
	    		||
	    		{isnull getassignedcuratorlogic player}
	    		//||
	    		//{_unit getvariable ["bis_fnc_moduleRemoteControl_owner",objnull] != player} //--- Another curator stole the unit
	    	};

	    	player addrating (-rating player + _rating);
    		objnull remotecontrol _unit;
    		_unit setvariable ["bis_fnc_moduleRemoteControl_owner",nil,true];
        deleteVehicle _unit;

    		if (alive player) then {
    			sleep 0.1; //--- Engine needs a delay in case controlled unit was deleted
		    	opencuratorinterface;

	    		waituntil {!isnull curatorcamera};
	    	};
	    	player switchcamera cameraview;
	    	bis_fnc_moduleRemoteControl_unit = nil;
	    	[_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,false]] call bis_fnc_callScriptedEventHandler;
	    	sleep 0.01;
    	};
    };

  },
  {true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _actionSpawnAvatar] call ace_interact_menu_fnc_addActionToZeus;
