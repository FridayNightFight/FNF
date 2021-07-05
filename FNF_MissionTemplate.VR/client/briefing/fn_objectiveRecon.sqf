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
