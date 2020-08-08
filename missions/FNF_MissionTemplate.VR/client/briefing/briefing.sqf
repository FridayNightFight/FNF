waitUntil {phx_loadoutAssigned};

ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
PHX_Diary = player createDiarySubject ["PHX_Diary", "Misc"];

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  player createDiaryRecord ["PHX_Diary", ["Admin","<execute expression='f_var_mission_timer = -1; publicVariableServer ""f_var_mission_timer""; [false] remoteExec [""phx_fnc_serverSafety"",2,false];'>End Safe Start</execute>"]];
};

sleep 3;

PHX_Diary_Uniforms = player createDiarySubject ["PHX_Diary_Uniforms", "Uniforms"];

_units = allUnits;

if ((west countSide _units) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_bluforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_loadout_uniform >> "picture");

  player createDiaryRecord ["PHX_Diary_Uniforms",["BLUFOR",
  format ["BLUFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg]
  ]];
};

if ((east countSide _units) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_opforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_loadout_uniform >> "picture");

  player createDiaryRecord ["PHX_Diary_Uniforms",["OPFOR",
  format ["OPFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg]
  ]];
};

if ((independent countSide _units) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_indforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_loadout_uniform >> "picture");

  player createDiaryRecord ["PHX_Diary_Uniforms",["INDFOR",
  format ["INDFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg]
  ]];
};

phx_loadout_uniform = nil;
