/*
  File: screenshot_kits.sqf
  Author: Bohemia Interactive / IndigoFox
  Description: Automated system for capturing front/back images of loadout presets.
  Credit: Base code borrowed  and adapted from BIS_fnc_exportEditorPreviews.

  Parameters:
    none

  Notes:
    The uniform and gear sets this script will process through is to be updated as more are made available. This code is currently WIP to achieve parity with the latest framework code.
*/





//   sleep 5;


//   indx_uniformPreviewCam cameraeffect ["terminate", "back"];
//   camDestroy indx_uniformPreviewCam;
// };





// [uniform, gear, classes]
// get the classes to check, which will match player vars during a session
_loadoutRolesToCheck = [];
{
  _loadoutRolesToCheck pushBack [
    _x # 0,
    _x # 1,
    (missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> (_x # 0)) call Bis_fnc_getCfgSubClasses
  ];
} forEach [
  ["RHS_UNI_CROATIAN_ARMY_2010","RHS_GEAR_HS_CROATIAN_2010_VHS"],
  ["RHS_UNI_CZ_CZECHFORCES_2010","RHS_GEAR_CZ_CZECHFORCES_2010_VZ58"],
  ["RHS_UNI_DE_BUNDESWEHR_2010","RHS_GEAR_DE_BUNDESWEHR_2010_G36"],
  // ["RHS_UNI_DPR_COSSACKS_2010","RHS_GEAR_RU_ARMY_2010_AK74M"],
  ["RHS_UNI_GR_GREEKFORCES_2010","RHS_GEAR_GR_GREEKFORCES_2010_L1A1"],
  ["RHS_UNI_ID_MEC_2010","RHS_GEAR_ID_MEC_2010_AK103"],
  ["RHS_UNI_ID_NAVSOG_2010","RHS_GEAR_ID_NAVSOG_2010_M16A4"],
  ["RHS_UNI_ID_REBELS_2010","RHS_GEAR_ID_REBELS_2010_AKMN"],
  ["RHS_UNI_RU_RATNIK_2020","RHS_GEAR_RU_ARMY_2010_AK74M"],
  ["RHS_UNI_RU_RATNIK_D_2020","RHS_GEAR_RU_ARMY_2010_AK74M"],
  ["RHS_UNI_RU_SPETSNAZ_2010","RHS_GEAR_RU_ARMY_2010_AK74M"],
  ["RHS_UNI_SERBIAN_ARMY_2010","RHS_GEAR_SERBIAN_ARMY_2010_M21"],
  ["RHS_UNI_UA_ARMY_2010","RHS_GEAR_US_ARMY_2010_M16A4"],
  ["RHS_UNI_US_ARMY_2020","RHS_GEAR_US_ARMY_2010_M16A4"],
  ["RHS_UNI_US_MARINES_DESERT_2010","RHS_GEAR_US_MARINES_2020_M27"],
  ["RHS_UNI_US_MARINES_WOODLAND_2010","RHS_GEAR_US_MARINES_2020_M27"],
  ["RHS_UNI_US_NAVY_2010","RHS_GEAR_US_NAVY_2010_MK18"],
  ["RHS_UNI_US_RANGERS_2020","RHS_GEAR_US_RANGERS_2010_SCAR"],
  ["RHS_UNI_YUGOSLAVIA_ARMY_2000","RHS_GEAR_YUGOSLAVIA_ARMY_2000_M70"]
];



//////////////////////////////////////////////////////////////////////////////


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

    _ctrlProgress progresssetposition (_foreachindex / count _loadoutRolesToCheck);

    //--- Update UI
    _ctrlInfo ctrlsetstructuredtext parsetext format ["Saving screenshot to<br /><t font='EtelkaMonospaceProBold' size='0.875'>[Arma 3 Profile]\Screenshots\%1</t><br />Note: The text overlay will not be saved.",_fileName];

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

    phx_bluforUniform = _uniformSelection;
    phx_bluforGear = _gearSelection;
    [_role, _object] call phx_loadout_fnc_applyLoadoutScreenshots;


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
