// [] spawn {
//   sleep 2;
//   player setDir 90;
//   _camPos = (player getPos [3, 90]) vectorAdd [0,2,2];

//   showcinemaBorder false;

//   indx_uniformPreviewCam = "camera" camCreate _camPos;
//   indx_uniformPreviewCam cameraeffect ["external", "back"];
//   indx_uniformPreviewCam camPrepareTarget ((getPosATL player) vectorAdd [-2,-1.5,0]);
//   indx_uniformPreviewCam camPreparePos _camPos;
//   indx_uniformPreviewCam camPrepareFOV 0.40;
//   indx_uniformPreviewCam camCommitPrepared 0;







//   sleep 5;


//   indx_uniformPreviewCam cameraeffect ["terminate", "back"];
//   camDestroy indx_uniformPreviewCam;
// };





// [uniform, gear, classes]
// get the classes to check, which will match player vars during a session
_loadoutRolesToCheck = [
  // [
  //   "VN_US_MACV"
  //   "VN_US_ARMY1970",
  //   (missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> "VN_US_MACV") call Bis_fnc_getCfgSubClasses
  // ],
  // [
  //   "VN_US_MACV",
  //   "VN_US_ARMY1970",
  //   (missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> "VN_US_MACV") call Bis_fnc_getCfgSubClasses
  // ],
  // [
  //   "RHS_US_ARMY_OCP",
  //   "RHS_US_ARMY",
  //   (missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> "RHS_US_ARMY_OCP") call Bis_fnc_getCfgSubClasses
  // ],
  [
    "VN_VC_Vietcong",
    "VN_NVA_VC",
    (missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> "VN_VC_Vietcong") call Bis_fnc_getCfgSubClasses
  ]
];


//////////////////////////////////////////////////////////////////////////////


fnc_addGear = {
  _itemStr = _this;

  if (_itemStr isEqualTo "") exitWith {};

  private _addGearErrorStr = "";

  _err = {
    params ["_item"];
    _addGearErrorStr = _addGearErrorStr + _item + "\n";
    _msg = format ["Error adding \n %1", _addGearErrorStr];
    titleText [_msg, "PLAIN"];
    titleFadeOut 20;
    systemChat ("Error adding " + _item);
  };

  if (typeName _itemStr isEqualTo "STRING") then {
    if (_itemStr find ":" != -1) then {
      _item = _itemStr select [0, _itemStr find ":"];
      _numToAdd = parseNumber (_itemStr select [(_itemStr find ":") + 1]);
      for "_i" from 1 to _numToAdd do {
        if (player canAdd _item) then {
          player additem _item;
        } else {
          _item call _err;
        };
      };
    } else {
      if (player canAdd _itemStr) then {
        player additem _itemStr;
      } else {
        _itemStr call _err;
      };
    };
  } else {
    _numToAdd = 1;

    _str = _itemStr select 0;
    _unit = _itemStr select 2;
    _item = _str;
    if (_str find ":" != -1) then {
      _item = (_str select [0, _str find ":"]);
      _numToAdd = parseNumber (_str select [(_str find ":") + 1]);
    };

    switch (_itemStr select 1) do {
      case "backpack": {
        for "_i" from 1 to _numToAdd do {
          if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
            _unit addItemToBackpack _item;
          } else {
            _itemStr call _err;
          };
        };
      };
      case "vest": {
        for "_i" from 1 to _numToAdd do {
          if ([_unit, _item, 1, false, true, false] call CBA_fnc_canAddItem) then {
            _unit addItemToVest _item;
          } else {
            if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
              _unit addItemToBackpack _item;
            } else {
              _itemStr call _err;
            };
          };
        };
      };
      case "uniform": {
        for "_i" from 1 to _numToAdd do {
          if ([_unit, _item, 1, true, false, false] call CBA_fnc_canAddItem) then {
            _unit addItemToUniform _item;
          } else {
            if ([_unit, _item, 1, false, true, false] call CBA_fnc_canAddItem) then {
              _unit addItemToVest _item;
            } else {
              if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
                _unit addItemToBackpack _item;
              } else {
                _itemStr call _err;
              };
            };
          };
        };
      };
    };
  };
};


fnc_assignLoadoutFromConfig = {
  params ["_unit", "_role", "_uniformSet", "_gearSet"];

  #define LOADOUTROLE(_str) (_role isEqualTo _str)
  #define CFGCOMMON missionConfigFile >> "CfgLoadouts" >> "common"
  #define CFGOPTICS missionConfigFile >> "CfgLoadouts" >> "optics"
  #define CFGUNIFORM missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> _uniformSelection >> _role
  #define CFGGEAR missionConfigFile >> "CfgLoadouts" >> "GEAR" >> _gearSelection >> _role

  {
    _unit unassignItem _x;
    _unit removeItem _x;
  } forEach [
    "NVGoggles",
    "NVGoggles_OPFOR",
    "NVGoggles_INDEP"
  ];
  removeAllItems _unit;
  removeAllWeapons _unit;
  removeUniform _unit;
  removeVest _unit;
  removeBackpack _unit;
  removeHeadgear _unit;
  removeGoggles _unit;

  private _cfgUniform = (CFGUNIFORM >> "uniform") call BIS_fnc_getCfgDataArray;
  private _cfgVest = (CFGUNIFORM >> "vest") call BIS_fnc_getCfgDataArray;
  private _cfgHeadgear = (CFGUNIFORM >> "headgear") call BIS_fnc_getCfgDataArray;
  private _cfgBackpack = (CFGUNIFORM >> "backpack") call BIS_fnc_getCfgDataArray;
  private _cfgBackpackItems = (CFGGEAR >> "backpackItems") call BIS_fnc_getCfgDataArray;
  private _cfgLaunchers = (CFGGEAR >> "launchers") call BIS_fnc_getCfgDataArray;
  private _cfgSidearms = (CFGGEAR >> "sidearms") call BIS_fnc_getCfgDataArray;
  private _cfgMagazines = (CFGGEAR >> "magazines") call BIS_fnc_getCfgDataArray;
  private _cfgItems = (CFGGEAR >> "items") call BIS_fnc_getCfgDataArray;
  private _cfgLinkedItems = (CFGGEAR >> "linkedItems") call BIS_fnc_getCfgDataArray;
  private _cfgWeaponChoices = (CFGGEAR >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  private _cfgAttachments = (CFGGEAR >> "attachments") call BIS_fnc_getCfgDataArray;
  private _cfgLauncherAttachments = (CFGGEAR >> "launcherAttachments") call BIS_fnc_getCfgDataArray;



  fnc_getWeaponMagazines = {
    params ["_toSearch", "_weapon", ["_allMuzzles", true]];
    private _out = [];
    {
      if ((_x splitString ':' select 0) in ([_weapon, _allMuzzles] call CBA_fnc_compatibleMagazines)) then {
        _out pushBack _x;
      };
    } forEach _toSearch;
    _out
  };


  // Wearable
  private _uniform = if (_cfgUniform isEqualTo []) then { "" } else { selectRandom _cfgUniform };
  private _vest = if (_cfgVest isEqualTo []) then { "" } else { selectRandom _cfgVest };
  private _backpack = if (_cfgBackpack isEqualTo []) then { "" } else { selectRandom _cfgBackpack };
  private _headgear = if (_cfgHeadgear isEqualTo []) then { "" } else { selectRandom _cfgHeadgear };



  _unit forceAddUniform _uniform;
  _unit addVest _vest;
  _unit addBackpack _backpack;
  _unit addHeadgear _headgear;

  // Items, grenades
  {[_x, "vest", _unit] call phx_fnc_addGear} forEach _cfgMagazines;
  {[_x, "uniform", _unit] call phx_fnc_addGear} forEach _cfgItems;
  {[_x, "backpack", _unit] call phx_fnc_addGear} forEach _cfgBackpackItems;
  {_unit linkItem _x} forEach _cfgLinkedItems;


  // Primary weapon and appropriate magazines
  phx_loadout_weaponChosen = if (count _cfgWeaponChoices > 0) then {selectRandom(_cfgWeaponChoices)} else {[]};
  phx_loadout_weaponChosen params ["_weapons", "_mags"];
  phx_loadout_weapon = selectRandom(_weapons);
  phx_loadout_weaponMagazines = [_mags, phx_loadout_weapon] call fnc_getWeaponMagazines;
  _unit addWeapon phx_loadout_weapon;
  {[_x, "vest", _unit] call phx_fnc_addGear; nil} count phx_loadout_weaponMagazines;


  // add silencer if RS
  if (getNumber(CFGGEAR >> "giveSilencer") isEqualTo 1) then {
    _muzzleAcc = [phx_loadout_weapon, "muzzle"] call CBA_fnc_compatibleItems;
    _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
    if (count _silencers > 0) then {_unit addPrimaryWeaponItem (_silencers select 0)};
  };


  // Sidearm and appropriate magazines
  phx_loadout_sidearmChosen = if (count _cfgSidearms > 0) then {selectRandom(_cfgSidearms)} else {""};
  phx_loadout_sidearmChosen params ["_sidearms", "_mags"];
  phx_loadout_sidearm = selectRandom(_sidearms);
  phx_loadout_sidearmMagazines = [_mags, phx_loadout_sidearm] call fnc_getWeaponMagazines;
  _unit addWeapon phx_loadout_sidearm;
  {[_x, "uniform", _unit] call phx_fnc_addGear; nil} count phx_loadout_sidearmMagazines;

  phx_loadout_launcher = if (count _cfgLaunchers > 0) then {selectRandom(_cfgLaunchers)} else {""};
  _unit addWeapon phx_loadout_launcher;



  if (LOADOUTROLE("DM")) then {
    _availOptics = ((CFGOPTICS >> "magnified") call BIS_fnc_getCfgDataArray) select {
      _x in ([primaryWeapon _unit, "optic"] call CBA_fnc_compatibleItems)
    };
    _unit addPrimaryWeaponItem selectRandom(_availOptics);
  };
  if (LOADOUTROLE("SNP")) then {
    _availOptics = ((CFGOPTICS >> "sniper") call BIS_fnc_getCfgDataArray) select {
      _x in ([primaryWeapon _unit, "optic"] call CBA_fnc_compatibleItems)
    };
    _unit addPrimaryWeaponItem selectRandom(_availOptics);
  };


  // set MAT
  private _matRoleVarArr = ["MATA1","MAT1","MATA2","MAT2"];
  private _matGunnerVarArr = ["MAT1","MAT2"];
  if (_role in _matRoleVarArr) then {
    _cfgMATDefault = (CFGGEAR >> "defaultMAT") call BIS_fnc_getCfgDataArray;
    if !(_cfgMATDefault isEqualTo []) then {
      phx_loadout_mediumantitank_weapon = _cfgMATDefault # 0;
      if (count _cfgMATDefault > 1) then {phx_loadout_mediumantitank_mag = _cfgMATDefault # 1};
      if (count _cfgMATDefault > 2) then {phx_loadout_mediumantitank_optic = _cfgMATDefault # 2};

      // add mags & load one
        // "debug_console" callExtension str(phx_loadout_mediumantitank_mag);
      private "_compatMag";
      if (!isNil "phx_loadout_mediumantitank_mag") then {
        {
          // "debug_console" callExtension ("Adding " + _x + " to inventory");
          [_x, "backpack", _unit] call phx_fnc_addGear;
        } forEach phx_loadout_mediumantitank_mag;
        _compatMag = (phx_loadout_mediumantitank_mag # 0) splitString ':';
      };

      if (_role in _matGunnerVarArr) then {
        _unit addWeapon phx_loadout_mediumantitank_weapon;
        if (!isNil "phx_loadout_mediumantitank_optic") then {
          _unit addSecondaryWeaponItem selectRandom(phx_loadout_mediumantitank_optic);
        };
        if (!isNil "_compatMag") then {
          // if we found a mag, try pre-loading the launcher
          _compatMag params ["_magClass", "_magCount"];
          _magCount = parseNumber(_magCount);
          _numOfMags = count ([_unit, _magClass] call CBA_fnc_getMagazineIndex);
          // some MAT rounds, when given to a player's inventory, will autoload into the launcher
          // if this DOESN'T happen, we need to do it manually. otherwise we want to leave it alone so the proper number given
          if (_numOfMags == _magCount) then {
            // player removeMagazine _magClass;
            [_unit, _magClass] call CBA_fnc_removeMagazine;
            _unit addSecondaryWeaponItem _magClass;
          };
        };
      };
    };
  };



  // load weapons
  {
      _x params ["_weaponClass", "_mags"];
      private _cfgWeapon = _weaponClass call CBA_fnc_getItemConfig;

      // check for multiple muzzles (eg: GL)
      private _muzzles = getArray (configFile >> "cfgWeapons" >> _weaponClass >> "muzzles") select {!(["SAFE", _x] call BIS_fnc_inString) && !(["melee", _x] call BIS_fnc_inString)};
      // "debug_console" callExtension str([_weaponClass, _muzzles]);

    {
      private _thisMuzzle = _x;
      private "_compatMag";
      // "debug_console" callExtension str([_weaponClass, _mags, configName(_cfgWeapon >> _thisMuzzle), [_mags, _cfgWeapon >> _thisMuzzle, false] call fnc_getWeaponMagazines]);

      if (_thisMuzzle == "this") then {
        _compatMag = ([_mags, _cfgWeapon, false] call fnc_getWeaponMagazines) select 0;
      } else {
        _compatMag = ([_mags, _cfgWeapon >> _thisMuzzle, false] call fnc_getWeaponMagazines) select 0;
      };
      _compatMag = _compatMag splitString ':' select 0;
      // "debug_console" callExtension str([_weaponClass, _thisMuzzle, _compatMag]);

      _unit removeMagazine _compatMag;
      switch (_weaponClass) do {
        case (primaryWeapon _unit): {
          _unit addPrimaryWeaponItem _compatMag;
        };
        case (handgunWeapon _unit): {
          _unit addHandgunItem _compatMag;
        };
      };
    } forEach _muzzles;
  } forEach [
    [primaryWeapon _unit, phx_loadout_weaponMagazines],
    [handgunWeapon _unit, phx_loadout_sidearmMagazines]
  ];

};


//--- Export pictures ------------------------------------

//--- Prepare the scene
_posZ = 250;
_pos = [1024,1024,_posZ];

_cam = "camera" camcreate _pos;
_cam cameraeffect ["internal","back"];
_cam campreparefocus [-1,-1];
_cam campreparefov 0.4;
_cam camcommitprepared 0;
showcinemaborder false;

// _sphereColor = "#(argb,8,8,3)color(0.93,1.0,0.98,0.1)"; //--- VR ground
_sphereColor = "#(argb,8,8,3)color(0.93,1.0,0.98,0.028)"; //--- VR sky
//_sphereColor = "#(argb,8,8,3)color(1,1,1,1)"; //--- White
_sphereGround = createvehicle ["Sphere_3DEN",_pos,[],0,"none"];
_sphereNoGround = createvehicle ["SphereNoGround_3DEN",_pos,[],0,"none"];
{
	_x setposatl _pos;
	_x setdir 0;
	_x setobjecttexture [0,_sphereColor];
	_x setobjecttexture [1,_sphereColor];
	_x hideobject true;
} foreach [_sphereGround,_sphereNoGround];

setaperture 45;//35;
setdate [2035,5,28,10,0];

//--- Is preview capturing in Eden?
_display = [] call bis_fnc_displayMission;
if (is3DEN) then {
	_display = finddisplay 313;
	["showinterface",false] call bis_fnc_3DENInterface;
};


//--- Prepare the UI
_ctrlInfoW = 0.5;
_ctrlInfoH = 0.2;
_ctrlInfo = _display ctrlcreate ["RscStructuredText",-1];
_ctrlInfo ctrlsetposition [
	safezoneX + 0.1,//safezoneX + safezoneW - _ctrlInfoW - 0.1,
	safezoneY + safezoneH - _ctrlInfoH,
	safezoneW - 0.2,//_ctrlInfoW,
	_ctrlInfoH
];
//_ctrlInfo ctrlsetbackgroundcolor [0,0,0,1];
//_ctrlInfo ctrlsetfontheight (_ctrlInfoH * 0.7);
_ctrlInfo ctrlcommit 0;

_ctrlProgressH = 0.01;
_ctrlProgress = _display ctrlcreate ["RscProgress",-1];
_ctrlProgress ctrlsetposition [
	safezoneX,
	safezoneY + safezoneH - _ctrlProgressH,
	safezoneW,
	_ctrlProgressH
];
_ctrlProgress ctrlcommit 0;

_screenTop = safezoneY;
_screenBottom = safezoneY + safezoneH;
_screenLeft = safezoneX;
_screenRight = safezoneX + safezoneW;



//--- Main loop -------------------------------------------
{

  _x params ["_uniformSelection","_gearSelection","_roles"];
	_class = "B_Soldier_F";
  _delay = 2; // time on each

  {
    _role = _x;
    //--- Get filename
    _fileName = format ["LoadoutPreviews\%1--%2\%3",_uniformSelection,_gearSelection,_role];

    //--- Update UI
    _ctrlInfo ctrlsetstructuredtext parsetext format ["Saving screenshot to<br /><t font='EtelkaMonospaceProBold' size='0.875'>[Arma 3 Profile]\Screenshots\%1</t><br />Note: The text overlay will not be saved.",_fileName];
    _ctrlProgress progresssetposition (_foreachindex / count _loadoutRolesToCheck);

    //--- Set position and camera angles (exsception for helipads)
    _camDirH = 135;
    _camDirV = 15;
    _posLocal = +_pos;
    if (_class iskindof "HeliH") then {
      _posLocal set [2,0];
      _camDirH = 90;
      _camDirV = 75;
    };

    //--- Create object
    _object = createvehicle [_class,_posLocal,[],0,"none"];
    if (_class iskindof "allvehicles") then {
      _object setdir 155;
    } else {
      _object setdir 270;
    };


    [_object, _role, _uniformSelection, _gearSelection] call fnc_assignLoadoutFromConfig;


    if (primaryweapon _object != "") then {_object switchmove "amovpercmstpslowwrfldnon"} else {_object switchmove "amovpercmstpsnonwnondnon";};
    _object setposatl _posLocal;
    _object switchaction "default";
    _timeCapture = time + _delay;
    if (_object iskindof "FlagCarrierCore") then {
      _object spawn {_this enablesimulation false;}; // Delay freezing to initialize flag
    } else {
      _object enablesimulation false;
    };

    //--- Caulculate bounding box corners
    _bbox = boundingboxreal _object;
    _bbox1 = _bbox select 0;
    _bbox2 = _bbox select 1;
    _worldPositions = [
      _object modeltoworld [_bbox1 select 0,_bbox1 select 1,_bbox1 select 2],
      _object modeltoworld [_bbox1 select 0,_bbox1 select 1,_bbox2 select 2],
      _object modeltoworld [_bbox1 select 0,_bbox2 select 1,_bbox1 select 2],
      _object modeltoworld [_bbox1 select 0,_bbox2 select 1,_bbox2 select 2],
      _object modeltoworld [_bbox2 select 0,_bbox1 select 1,_bbox1 select 2],
      _object modeltoworld [_bbox2 select 0,_bbox1 select 1,_bbox2 select 2],
      _object modeltoworld [_bbox2 select 0,_bbox2 select 1,_bbox1 select 2],
      _object modeltoworld [_bbox2 select 0,_bbox2 select 1,_bbox2 select 2]
    ];

    #ifdef DEBUG
      {
        _x setpos (_worldPositions select _foreachindex);
      } foreach _helpers;
    #endif

    //--- Set background sphere
    _pointLowest = 0;
    _pointHighest = 0;
    {
      _xZ = (_x select 2) - _posZ;
      if (_xZ > _pointHighest) then {_pointHighest = _xZ;};
      if (_xZ < _pointLowest) then {_pointLowest = _xZ;};
    } foreach _worldPositions;
    _sphere = if (abs(_pointLowest) > abs(_pointHighest * 2/3)) then {_sphereNoGround} else {_sphereGround};
    _sphere hideobject false;
    _sphere setpos _pos;

    //--- Set camera
    _camAngle = _camDirV;
    _camDis = (1.5 * ((sizeof _class) max 0.1)) min 124 max 0.2; //--- 125 m is a sphere diameter
    _camPos = [_posLocal,_camDis,_camDirH] call bis_fnc_relpos;
    _camPos set [2,/*_posZ*/((_object modeltoworld [0,0,0]) select 2) + (tan _camAngle * _camDis)];
    _cam campreparepos _camPos;
    _cam campreparetarget (_object modeltoworld [0,0,0]);
    _cam campreparefocus [-1,-1];
    _cam campreparefov 0.7;
    _cam camcommitprepared 0;
    sleep 0.01; //--- Delay for camera to load

    if (_class iskindof "man" && !(_class iskindof "animal")) then {
      //--- Zoom in to character's torso to make inventory more apparent
      _cam campreparetarget (_object modeltoworld [0,0,1.25]);
      _cam campreparefov 0.1;
      _cam camcommitprepared 0;
    } else {
      //--- Calculate target
      _extremes = [0.5,0.5,0.5,0.5]; //--- Left, Right, Top, Bottom
      {
        _screenPos = worldtoscreen _x;
        if (count _screenPos > 0) then {
          _screenPosX = _screenPos select 0;
          _screenPosY = _screenPos select 1;
          if (_screenPosX < (_extremes select 0)) then {_extremes set [0,_screenPosX];};
          if (_screenPosX > (_extremes select 1)) then {_extremes set [1,_screenPosX];};
          if (_screenPosY > (_extremes select 3)) then {_extremes set [3,_screenPosY];};
          if (_screenPosY < (_extremes select 2)) then {_extremes set [2,_screenPosY];};
        };
      } foreach _worldPositions;
      _cam campreparetarget screentoworld [
        (_extremes select 0) + ((_extremes select 1) - (_extremes select 0)) / 2,
        (_extremes select 2) + ((_extremes select 3) - (_extremes select 2)) / 2
      ];

      //--- Calculate zoom - get the closest zoom where all bounding box corners are still visible
      _fovStart = if (_camDis < 0.35) then {0.4} else {0.1}; //--- When camera is too close, it cuts into the model itself
      for "_f" from _fovStart to 0.7 step 0.01 do {
        _cam campreparefov _f;
        _cam camcommitprepared 0;
        sleep 0.01; //--- Delay for camera to load
        _onScreen = true;
        {
          _screenPos = worldtoscreen _x;
          if (count _screenPos == 0) then {_screenPos = [10,10];};
          if (abs (linearconversion [_screenLeft,_screenRight,_screenPos select 0,-1,1]) > 1) exitwith {_onScreen = false;};
          if (abs (linearconversion [_screenTop,_screenBottom,_screenPos select 1,-1,1]) > 1) exitwith {_onScreen = false;};
        } foreach _worldPositions;
        if (_onScreen) exitwith {};
      };
    };

    //--- Wait for model to load and take a screenshot
    waituntil {time > _timeCapture};
    screenshot (_fileName + "_F.png");
    sleep 0.01;

    _object setDir ((getDir _object) + 180);
    screenshot (_fileName + "_R.png");
    sleep _delay;


    //--- Delete the object
    _object setpos [10,10,10];
    deletevehicle _object;
    _sphere hideobject true;
  } forEach _roles;

} foreach _loadoutRolesToCheck;
// } foreach (_loadoutRolesToCheck select [0,3]);



//--- Reset the scene
_cam cameraeffect ["terminate","back"];
camdestroy _cam;
deletevehicle _sphereGround;
deletevehicle _sphereNoGround;
setaperture -1;
ctrldelete _ctrlInfo;
ctrldelete _ctrlProgress;

if (is3DEN) then {
	get3dencamera cameraeffect ["internal","back"];
	["showinterface",true] call bis_fnc_3DENInterface;
};
