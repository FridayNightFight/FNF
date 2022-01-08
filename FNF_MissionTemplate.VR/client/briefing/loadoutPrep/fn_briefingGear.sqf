
/////////////////////////////////////////
          // NOTIFY //
/////////////////////////////////////////

params [["_showNotification", false]];
private _loadoutRole = player getVariable ["phx_lastLoadout", "UNKNOWN"];
#define PLAYERLOADOUTVAR _LOADOUTROLE
#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)

// roles list in fn_clientInit.sqf
private _strRole = " ";
_strRole = [phx_loadout_roles, PLAYERLOADOUTVAR, "Unknown"] call BIS_fnc_getFromPairs;
if (typeName _strRole isEqualTo "ARRAY") then {_strRole = _strRole select 0};
// if (LOADOUTROLE("PL")) then {_strRole = " Platoon Leader"};
// if (LOADOUTROLE("SL") || LOADOUTROLE("SGT")) then {_strRole = " Squad Leader"};
// if (LOADOUTROLE("TL")) then {_strRole = " Team Leader"};
// if (LOADOUTROLE("AR")) then {_strRole = "n Automatic Rifleman"};
// if (LOADOUTROLE("ARA")) then {_strRole = "n Asst. Automatic Rifleman"};
// if (LOADOUTROLE("GR")) then {_strRole = " Grenadier"};
// if (LOADOUTROLE("GRIR")) then {_strRole = " Grenadier w/ HuntIR"};
// if (LOADOUTROLE("MG")) then {_strRole = " Machine Gunner"};
// if (LOADOUTROLE("MGA")) then {_strRole = "n Asst. Machine Gunner"};
// if (LOADOUTROLE("CE")) then {_strRole = " Combat Engineer"};
// if (LOADOUTROLE("LAT")) then {_strRole = " Light Anti-Tank Rifleman"};
// if (LOADOUTROLE("MAT1") || LOADOUTROLE("MAT2")) then {_strRole = " Medium Anti-Tank Specialist"};
// if (LOADOUTROLE("MATA1") || LOADOUTROLE("MATA2")) then {_strRole = " Medium Anti-Tank Assistant"};
// if (LOADOUTROLE("RI")) then {_strRole = " Rifleman"};
// if (LOADOUTROLE("RIS")) then {_strRole = " Senior Rifleman"};
// if (LOADOUTROLE("DM")) then {_strRole = " Designated Marksman"};
// if (LOADOUTROLE("SNP")) then {_strRole = " Sniper"};
// if (LOADOUTROLE("CR")) then {_strRole = " Crewman"};
// if (LOADOUTROLE("PI")) then {_strRole = " Pilot"};
// if (LOADOUTROLE("MED")) then {_strRole = " Medic"};
// if (LOADOUTROLE("BASE")) then {_strRole = " Weapon Operator"};


#define STYLE_HEADER_NOTIFY "<t align='center' size='1.4' color='#e1701a' face='PuristaBold'>"
#define STYLE_TEXT_NOTIFY "<t align='center' size='0.7' face='EtelkaMonospacePro'>"
#define STYLE_HEADER_UI "<t size='1.4' color='#e1701a' face='PuristaBold'>"
#define STYLE_TEXT_UI "<t size='0.7' face='EtelkaMonospacePro'>"
#define STYLE_HEADER_DIARY "<font size='16' color='#e1701a' face='PuristaBold'>"
#define STYLE_TEXT_DIARY "<font size='12' face='PuristaMedium'>"

// show hint
_fnc_hintDetails = {
  params ["_class", "_count", "_notifyString", "_diaryString", "_uiString"];
  private _thisCfg = _class call CBA_fnc_getItemConfig;
  private _dispName = [_thisCfg] call BIS_fnc_displayName;
  private _desc = getText(_thisCfg >> "descriptionShort");
  private _pic = getText(_thisCfg >> "picture");

  private _notifyArr = [];
  private _uiArr = [];
  private _diaryArr = [];
  if (!isNil "_count") then {
    _notifyArr pushBack format["<t align='center'><img size='2.5' image='%1'/><t valign='bottom'>x%2</t>", _pic, _count];
    _uiArr pushBack format["<t><img size='2.5' image='%1'/><t valign='bottom'>x%2</t>", _pic, _count];
    _diaryArr pushBack format[STYLE_TEXT_DIARY + "<img height='75' image='%1'/><font valign='bottom'>x%2</font>", _pic, _count];
  } else {
    _notifyArr pushBack format["<t align='center'><img size='2.5' image='%1'/>", _pic];
    _uiArr pushBack format["<t><img size='2.5' image='%1'/>", _pic];
    _diaryArr pushBack format[STYLE_TEXT_DIARY + "<img height='75' image='%1'/>", _pic];
  };
  _notifyArr append [
    format[STYLE_TEXT_NOTIFY + "%1</t>", _dispName],
    // format[STYLE_TEXT_NOTIFY + "%1</t>", _desc],
    "</t>"
  ];
  _uiArr append [
    format[STYLE_TEXT_UI + "%1</t>", _dispName],
    // format[STYLE_TEXT_NOTIFY + "%1</t>", _desc],
    "</t>"
  ];
  _diaryArr append [
    format[STYLE_TEXT_DIARY + "%1</font>", _dispName],
    format[STYLE_TEXT_DIARY + "%1</font>", _desc],
    "</font>"
  ];

  // [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
  _notifyString pushBack (_notifyArr joinString '<br/>');
  _uiString pushBack (_uiArr joinString '<br/>');
  _diaryString pushBack (_diaryArr joinString '<br/>');
  true
};

_fnc_notesItems = {
  params [
    "_items",
    ["_showCount", true],
    ["_structText", false]
  ];

  private _arr = [];
  _procItems = _items call BIS_fnc_consolidateArray;
  // "debug_console" callExtension str(_items);
  {
    private _thisCfg = (_x # 0) call CBA_fnc_getItemConfig;
    private _dispName = [_thisCfg] call BIS_fnc_displayName;
    private _desc = getText(_thisCfg >> "descriptionShort");
    private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
    private _count = _x # 1;

    if (!_structText) then {
      if (_showCount) then {
        _arr pushBack format["<img " + SMALLPIC_DIARY + " image='%1'/><execute expression='systemChat ""%2"";'>x%3</execute>", _pic, _dispName, _count];
      } else {
        _arr pushBack format["<img " + SMALLPIC_DIARY + " image='%1'/><execute expression='systemChat ""%2"";'>o</execute>", _pic, _dispName];
      };
    } else {
      if (_showCount) then {
        _arr pushBack format["<img " + SMALLPIC_NOTIFY + " image='%1'/>x%3 %2", _pic, _dispName, _count];
        _arr pushBack "<br/>";
      } else {
        _arr pushBack format["<img " + SMALLPIC_NOTIFY + " image='%1'/> %2", _pic, _dispName];
        _arr pushBack "<br/>";
      };
    }
  } forEach _procItems;
  _arr joinString "";
};

BIGPIC_NOTIFY = "size='2.5'";
BIGPIC_DIARY = "height='75'";
SMALLPIC_NOTIFY = "size='1.2'";
SMALLPIC_DIARY = "height='30'";

_fnc_notesWeapon = {
  params [
    "_weapon",
    "_count",
    "_notifyString",
    "_diaryString",
    "_uiString"
  ];

  _details = [];
  _toGather = [_weapon];
  _toGather append (player weaponAccessories _weapon);
  {
    private _out = [];
    private _class = _x;
    if !(_class isEqualTo "") then {
      private _thisCfg = _class call CBA_fnc_getItemConfig;
      private _dispName = [_thisCfg] call BIS_fnc_displayName;
      private _desc = getText(_thisCfg >> "descriptionShort");
      private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
      if (isNil "_pic") then {
        _pic = (_thisCfg >> "uiPicture") call BIS_fnc_getCfgData;
      };
      // "debug_console" callExtension str([_class,_thisCfg,_dispName,_desc,_pic]);

      _out pushBack ["class", _class];
      _out pushBack ["config", _thisCfg];
      _out pushBack ["displayName", _dispName];
      _out pushBack ["description", _desc];
      _out pushBack ["picture", _pic];
      _details pushBack _out;
    } else {
      _details pushBack ["", ""];
    };
  } forEach _toGather;
  // "debug_console" callExtension str(_details);
  _weaponArr = +_details # 0;
  // "debug_console" callExtension str(_weaponArr);
  _details = _details - [_weaponArr];
  // "debug_console" callExtension str(_details);

  private _notifyArr = [];
  private _uiArr = [];
  private _diaryArr = [];
  _notifyArr pushBack format["<t align='center'><img " + BIGPIC_NOTIFY + " image='%1'/>", [_weaponArr, "picture"] call BIS_fnc_getFromPairs];
  _uiArr pushBack format["<t><img " + BIGPIC_NOTIFY + " image='%1'/>", [_weaponArr, "picture"] call BIS_fnc_getFromPairs];
  _diaryArr pushBack format[STYLE_TEXT_DIARY + "<img " + BIGPIC_DIARY + " image='%1'/>", [_weaponArr, "picture"] call BIS_fnc_getFromPairs];

  private _accNotify = "";
  private _accUi = "";
  private _accDiary = "";
  {
    // "debug_console" callExtension ([_x, "picture"] call BIS_fnc_getFromPairs);
    private _pic = [_x, "picture"] call BIS_fnc_getFromPairs;
    private _dispName = [_x, "displayName"] call BIS_fnc_getFromPairs;
    if !(isNil "_pic") then {
      if !(_pic isEqualTo "") then {
        _accNotify = _accNotify + format["<img " + SMALLPIC_NOTIFY + " image='%1'/>", _pic];
        _accUi = _accUi + format["<img " + SMALLPIC_NOTIFY + " image='%1'/>", _pic];
        _accDiary = _accDiary + format["<img " + SMALLPIC_DIARY + " image='%1'/><execute expression='systemChat ""%2"";'>o</execute>", _pic, _dispName];
      };
    };
  } forEach _details;
  _notifyArr pushBack _accNotify;
  _uiArr pushBack _accNotify;
  _diaryArr pushBack _accDiary;

  _notifyArr append [
    format[STYLE_TEXT_NOTIFY + "%1</t>", [_weaponArr, "displayName"] call BIS_fnc_getFromPairs],
    "</t>"
  ];

  _uiArr append [
    format[STYLE_TEXT_UI + "%1</t>", [_weaponArr, "displayName"] call BIS_fnc_getFromPairs],
    "</t>"
  ];

  _diaryArr append [
    format[STYLE_TEXT_DIARY + "%1</font>", [_weaponArr, "displayName"] call BIS_fnc_getFromPairs],
    format[STYLE_TEXT_DIARY + "%1</font>", [_weaponArr, "description"] call BIS_fnc_getFromPairs],
    "</font>"
  ];

  // [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
  _notifyString pushBack (_notifyArr joinString '<br/>');
  _uiString pushBack (_uiArr joinString '<br/>');
  _diaryString pushBack (_diaryArr joinString '<br/>');
  true
};



private _notifyString = [];
private _diaryString = [];
private _uiString = [];

_notifyString pushBack (STYLE_HEADER_NOTIFY + "ROLE</t>");
_uiString pushBack (STYLE_HEADER_UI + "ROLE</t>");
_diaryString pushBack (STYLE_HEADER_DIARY + "ROLE</font>");
_notifyString pushBack ("<t align='center' face='PuristaMedium'>You are a " + _strRole + "<br/>in " + (roleDescription player splitString '@' select 1) + "</t>");
_uiString pushBack ("<t face='PuristaMedium'>You are a " + _strRole + "<br/>in " + (roleDescription player splitString '@' select 1) + "</t>");
_diaryString pushBack ("<font align='center' face='PuristaMedium'>You are a " + _strRole + " in " + (roleDescription player splitString '@' select 1) + "</font><br/>");

_diaryString pushBack (STYLE_HEADER_DIARY + "General Equipment</font>");
_uiString pushBack (STYLE_HEADER_UI + "General Equipment</font>");

// [{time > 2}, {
//     ["<t align='center'>Uniform and gear assigned.</t>", "success", 5] call phx_ui_fnc_notify;
// }] call CBA_fnc_waitUntilAndExecute;
["<t align='center'>Uniform and gear assigned.</t>", "success", 5] call phx_ui_fnc_notify;

_diaryString pushBack ([_playerMagazines, true] call _fnc_notesItems);
_diaryString pushBack ([items player, true] call _fnc_notesItems);
_diaryString pushBack ([assignedItems player, false] call _fnc_notesItems);
_diaryString pushBack "<br/>";

_uiString pushBack ([_playerMagazines, true, true] call _fnc_notesItems);
_uiString pushBack ([items player, true, true] call _fnc_notesItems);
_uiString pushBack ([assignedItems player, false, true] call _fnc_notesItems);
_uiString pushBack "<br/>";

// _currentLoadout = (getUnitLoadout player) params [
//   "_primaryWeapon",
//   "_secondaryWeapon",
//   "_handgunWeapon",
//   "_uniform",
//   "_vest",
//   "_backpack",
//   "_helmet",
//   "_facewear",
//   "_binocularItem",
//   "_linkedItems"
// ];
// _primaryWeapon params [
//   "_primaryWeaponRifle",
//   "_primaryWeaponSilencer",
//   "_primaryWeaponLaser",
//   "_primaryWeaponOptic",
//   "_primaryWeaponMag",
//   "_primaryWeaponSecondaryMag",
//   "_bipod"
// ];
// _secondaryWeapon params [
//   "_secondaryWeaponRifle",
//   "_secondaryWeaponSilencer",
//   "_secondaryWeaponLaser",
//   "_secondaryWeaponOptic",
//   "_secondaryWeaponMag",
//   "_secondaryWeaponSecondaryMag",
//   "_bipod"
// ];
// _handgunWeapon params [
//   "_sidearmWeaponRifle",
//   "_sidearmWeaponSilencer",
//   "_sidearmWeaponLaser",
//   "_sidearmWeaponOptic",
//   "_sidearmWeaponMag",
//   "_sidearmWeaponSecondaryMag",
//   "_bipod"
// ];


_notifyString pushBack (STYLE_HEADER_NOTIFY + "Primary Weapon</t>");
_uiString pushBack (STYLE_HEADER_UI + "Primary Weapon</t>");
_diaryString pushBack (STYLE_HEADER_DIARY + "Primary Weapon</font>");
[primaryWeapon player, nil, _notifyString, _diaryString, _uiString] call _fnc_notesWeapon;

_notifyString pushBack (STYLE_HEADER_NOTIFY + "Handgun Weapon</t>");
_uiString pushBack (STYLE_HEADER_UI + "Handgun Weapon</t>");
_diaryString pushBack (STYLE_HEADER_DIARY + "Handgun Weapon</font>");
[handgunWeapon player, nil, _notifyString, _diaryString, _uiString] call _fnc_notesWeapon;

if (secondaryWeapon player != "") then {
  _notifyString pushBack (STYLE_HEADER_NOTIFY + "Launcher</t>");
  _uiString pushBack (STYLE_HEADER_UI + "Launcher</t>");
  _diaryString pushBack (STYLE_HEADER_DIARY + "Launcher</font>");
  [secondaryWeapon player, nil, _notifyString, _diaryString, _uiString] call _fnc_notesWeapon;
};

if (LOADOUTROLE("CE")) then {
  _notifyString pushBack (STYLE_HEADER_NOTIFY + "Explosives</t>");
  _uiString pushBack (STYLE_HEADER_UI + "Explosives</t>");
  _diaryString pushBack (STYLE_HEADER_DIARY + "Explosives</font>");
  {
    (_x splitString ':') params ["_class", "_count"];
    [_class, _count, _notifyString, _diaryString, _uiString] call _fnc_hintDetails;
  } forEach (phx_selector_currentExplosives select [1,2]);

  _notifyString pushBack (STYLE_HEADER_NOTIFY + "Grenades</t>");
  _uiString pushBack (STYLE_HEADER_UI + "Grenades</t>");
  _diaryString pushBack (STYLE_HEADER_DIARY + "Grenades</font>");
  {
    (_x splitString ':') params ["_class", "_count"];
    [_class, _count, _notifyString, _diaryString, _uiString] call _fnc_hintDetails;
  } forEach (phx_selector_currentGrenades select [1,2]);
};

if (_showNotification) then {
  [{time > 2}, {
    [_this joinString '<br/>', "success", 15] call phx_ui_fnc_notify;
  }, _notifyString] call CBA_fnc_waitUntilAndExecute;
};

[phx_ui_structTextRef, "My Starting Loadout", _uiString joinString '<br/>'] call BIS_fnc_setToPairs;

phx_briefing_loadoutString = _diaryString;

if (isNil "phx_briefing_loadoutInfo") then {
  phx_briefing_loadoutInfo = player createDiaryRecord [
    "Diary",
    [
      "My Starting Loadout",
      phx_briefing_loadoutString joinString "<br/>"
    ]
  ];
  [{getClientStateNumber > 8}, {
    player setDiaryRecordText [["Diary", phx_briefing_loadoutInfo], ["My Starting Loadout", phx_briefing_loadoutString joinString "<br/>"]];
  }] call CBA_fnc_waitUntilAndExecute;
} else {
  player setDiaryRecordText [["Diary", phx_briefing_loadoutInfo], ["My Starting Loadout", phx_briefing_loadoutString joinString "<br/>"]];
};
true
