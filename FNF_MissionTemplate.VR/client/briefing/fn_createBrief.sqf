ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa"];

_getName = {
  getText (configFile >> "cfgWeapons" >> _this >> "displayName");
};

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = -1; publicVariableServer ""f_var_mission_timer""; systemChat ""Ending Safe Start"";'>End Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
  if !(f_var_mission_timer <= 1) then {
    f_var_mission_timer = f_var_mission_timer - 1;
    publicVariableServer ""f_var_mission_timer"";
  };
  systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
  '>-1 Minute to Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = f_var_mission_timer + 1; publicVariableServer ""f_var_mission_timer""; systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];'>+1 Minute to Safe Start</execute>"]];

  [{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {player removeDiarySubject "PHX_Diary_Admin_Safestart"}] call CBA_fnc_waitUntilAndExecute;
};

PHX_Diary_Details = player createDiarySubject ["PHX_Diary_Details", "Mission Details", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

_varStr = "";

if (!isNil "phx_briefing_west_uniform" || !isNil "phx_briefing_west_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_west_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_west_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["BLUFOR Uniform",
  format ["BLUFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  BLUFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["BLUFOR MAT: %1", phx_bluAT call _getName] + "<br/>";
};

if (!isNil "phx_briefing_east_uniform" || !isNil "phx_briefing_east_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_east_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_east_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["OPFOR Uniform",
  format ["OPFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  OPFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["OPFOR MAT: %1", phx_redAT call _getName] + "<br/>";
};

if (!isNil "phx_briefing_ind_uniform" || !isNil "phx_briefing_ind_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_ind_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_ind_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["INDFOR Uniform",
  format ["INDFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  INDFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["INDFOR MAT: %1", phx_grnAT call _getName] + "<br/>";
};

if (phx_defendingSide != sideEmpty) then {
  _varStr = _varStr + "<br/>";
  _varStr = _varStr + format ["Defender fortify points: %1", phx_fortifyPoints];
};
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Time limit: %1 minutes", phx_missionTimeLimit];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Safe start time: %1 minutes", phx_safeStartTime];
_varStr = _varStr + "<br/>";
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Maximum view distance: %1m", phx_maxViewDistance];

player createDiaryRecord ["PHX_Diary_Details",["Vars",_varStr]];
[{!isNil "phx_overTimeConStr"}, {
  player createDiaryRecord ["PHX_Diary_Details",["Overtime Condition",phx_overTimeConStr]];
}] call CBA_fnc_waitUntilAndExecute;


// Reconnaissance photos in Diary
player createDiarySubject["Recon", "Reconnaissance", "\A3\ui_f\data\igui\cfg\simpleTasks\types\scout_ca.paa"];

switch (phx_gameMode) do {
    case "destroy":{
        #include "..\..\mode_config\destroy.sqf"

        _objArr = [_obj1, _obj2, _obj3];
        _objArr = _objArr select {
            !isNull(_x# 0)
        };

        for [{
            private _i = (count _objArr)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _item = _objArr select(_i - 1);
            _item params["_obj", "_mark", "_label"];
            _objNumber = _i;
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Objective %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Objective %1 - <marker name='%2'>%3</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""%3""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark,
                        (
                          if (!(_label isEqualTo "")) then {
                              _label
                          } else {
                            "Location"
                        })
                    ]
                ]
            ];
        };
    };
    case "neutralSector":{
      #include "..\..\mode_config\neutralSector.sqf"

        _sectors = [phx_sector1];
        switch (_numberOfSectors) do {
            case 2: {
                _sectors pushBack phx_sector2;
            };
            case 3: {
                _sectors pushBack phx_sector2;
                _sectors pushBack phx_sector3;
            };
        };

        for [{
            private _i = (count _sectors)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _sector = _sectors select(_i - 1);
            _objNumber = _i;
            _loc = getPos _sector;
            _mark = createMarkerLocal [str _sector + "Mark", _loc];
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Sector %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Sector %1 - <marker name='%2'>Location</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""Capture the Sector""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark
                    ]
                ]
            ];
        };
    };
    case "adSector":{
        #include "..\..\mode_config\adSector.sqf"

        _sectors = [];

        switch (_numberOfSectors) do {
            case 1:{
                    _sectors pushBack phx_sec1
                };
            case 2:{
                    _sectors pushBack phx_sec1;
                    _sectors pushBack phx_sec2
                };
            case 3:{
                    _sectors pushBack phx_sec1;
                    _sectors pushBack phx_sec2;
                    _sectors pushBack phx_sec3
                };
        };

        for [{
            private _i = (count _sectors)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _sector = _sectors select(_i - 1);
            _mark = str _sector + "TextMark";
            _objNumber = _i;
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Sector %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Sector %1 - <marker name='%2'>Location</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""Capture the Sector""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark
                    ]
                ]
            ];
        };
    };
    case "uplink":{
        #include "..\..\mode_config\uplink.sqf"

        _terminals = [];
        switch (_numberOfTerminals) do {
            case 2:{
                    _terminals = [term1, term2]
                };
            case 3:{
                    _terminals = [term1, term2, term3]
                };
            default {};
        };

        for [{
            private _i = (count _terminals)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _terminal = _terminals select(_i - 1);
            _mark = str _terminal + "Mark";
            _objNumber = _i;
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Terminal %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Terminal %1 - <marker name='%2'>Location</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""Hack the Terminal""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark
                    ]
                ]
            ];
        };
    };
    case "rush":{
        #include "..\..\mode_config\rush.sqf"

        _terminals = [];
        switch (_numberOfTerminals) do {
            case 2:{
                    _terminals = [term1, term2]
                };
            case 3:{
                    _terminals = [term1, term2, term3]
                };
            default {};
        };

        for [{
            private _i = (count _terminals)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _terminal = _terminals select(_i - 1);
            _mark = str _terminal + "Mark";
            _objNumber = _i;
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Terminal %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Terminal %1 - <marker name='%2'>Location</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""Hack the Terminal""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark
                    ]
                ]
            ];
        };
    };
    case "connection":{
        #include "..\..\mode_config\connection.sqf"

        _terminals = [];
        switch (_numberOfTerminals) do {
            case 2:{
                    _terminals = [term1, term2]
                };
            case 3:{
                    _terminals = [term1, term2, term3]
                };
            default {};
        };

        for [{
            private _i = (count _terminals)
        }, {
            _i > 0
        }, {
            _i = _i - 1
        }] do {
            _terminal = _terminals select(_i - 1);
            _mark = str _terminal + "Mark";
            _objNumber = _i;
            player createDiaryRecord[
                "Recon", [
                    format[
                        "Terminal %1",
                        _objNumber
                    ],
                    format[
                        "<font face='PuristaMedium'>Terminal %1 - <marker name='%2'>Location</marker><br/><br/>Notes:<br/><font size='12'>Recon cam will always be oriented approximately north.<br/>Enemy players and non-objective vehicles/items will be hidden.</font></font><br/><br/><executeClose expression='[%1, ""Hack and Hold the Terminal""] spawn phx_fnc_objectivePreview;'>Show reconnaissance image</executeClose>",
                        _objNumber,
                        _mark,
                        _fileName
                    ]
                ]
            ];
        };
    };
    case "captureTheFlag":{
        // execVM "modes\ctf\ctf_client.sqf";
    };
};

phx_briefCreated = true;
