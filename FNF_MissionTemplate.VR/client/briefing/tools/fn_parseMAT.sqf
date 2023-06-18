/*
* Author: IndigoFox
* Used to generate diary string or structured text for UI applications containing the assigned MAT for the target faction.
*
* Arguments:
* 0: Queried side <SIDE>
* 1: An array containing the MAT settings for BRAVO squad, or ["GEARDEFAULT"] to cross-check the gear set's defaults <ARRAY>
*   i.e. ["rhs_weap_maaws",[rhs_mag_maaws_HEAT:2,rhs_mag_maaws_HE:2],["rhs_optic_maaws"],"RELOAD","CARLG"]
* 2: An array containing the MAT settings for DELTA squad, or ["GEARDEFAULT"] to cross-check the gear set's defaults <ARRAY>
* 3. (optional) default false: return diary string, true: return Structured Text
*
* Return Value:
* <STRING> or <Structured Text>
*
* Example:
* [independent, fnf_grnAT, fnf_grnAT_Delta] call fnf_briefing_fnc_parseMAT
*
* Public: No
*/

#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

params ["_side", "_bravoOption", ["_structText", false]];

private "_gearLoadout";
switch (_side) do {
  case east: {_gearLoadout = fnf_opforGear};
  case west: {_gearLoadout = fnf_bluforGear};
  case independent: {_gearLoadout = fnf_indforGear};
};

private _textOut = [];
{
  _x params ["_setting", "_role"];

  private "_MATData";

  // "debug_console" callExtension str(_x);
  if (count _setting > 0) then {
    if (_setting # 0 isEqualTo "GEARDEFAULT") then {
      // "debug_console" callExtension str([_gearLoadout,_role,fnf_bluAT]);
      _MATData = (missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> _gearLoadout >> _role >> "defaultMAT") call BIS_fnc_getCfgDataArray select 0;
      //  "debug_console" callExtension str(_data);
      // _textOut pushBack (_data # 0);
    } else {
      _MATData = _setting;
      // _textOut pushBack (_setting # 0);
    };
  } else {
    _textOut pushBack "";
  };

  // "debug_console" callExtension str(_MATData);

  _MATData params ["_launcher", "_ammo", "_optics", "_type"];
  private _launcherInfo = _launcher call fnf_briefing_fnc_getItemInfo;

  if (!_structText) then {
    _textOut pushBack format [
      "%1 %2: <font color='" + COLOR3 + "'>%3</font><br/><img width='120' image='%4'/><br/>%5<br/>%6",
      _side call BIS_fnc_sideName,
      _role,
      [_launcherInfo, "displayName"] call BIS_fnc_getFromPairs,
      [_launcherInfo, "picture"] call BIS_fnc_getFromPairs,
      (if (_type == "RELOAD") then {format["%1 (per person)", [_ammo, true] call fnf_briefing_fnc_notesItems]} else {""}),
      [_launcherInfo, "description"] call BIS_fnc_getFromPairs
    ] + "<br/><br/>";
  } else {
    _textOut pushBack format [
      "%1 %2: <t color='" + COLOR3 + "'>%3</t><br/><img size='4' image='%4'/><br/>%5<br/>",
      _side call BIS_fnc_sideName,
      _role,
      [_launcherInfo, "displayName"] call BIS_fnc_getFromPairs,
      [_launcherInfo, "picture"] call BIS_fnc_getFromPairs,
      (if (_type == "RELOAD") then {format["%1 (per person)", [_ammo, true, true] call fnf_briefing_fnc_notesItems]} else {""}),
      [_launcherInfo, "description"] call BIS_fnc_getFromPairs
    ];
  };

} forEach [
  [_bravoOption, "MAT1"]
];

_textOut joinString "<br/>"
