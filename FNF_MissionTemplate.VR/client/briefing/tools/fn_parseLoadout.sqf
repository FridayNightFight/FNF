/*
* Author: IndigoFox
* Used in tandem with fnf_server_fnc_sendUniforms to parse data from the server and display the weaponry assigned to each faction
* as well as name, description, and author of the set for use in the diary notes and UI.
*
* Arguments:
* 0: Array of gear set information from the server <ARRAY>
* 1: (optional) false: diary string, true: structured text for UI
*
* Return Value:
* <STRING> or <Structured Text>
*
* Example:
* [fnf_briefing_ind_loadout] call fnf_briefing_fnc_parseLoadout
*
* Public: No
*/

params [["_data", []], ["_structTxt", false]];
_data params [["_meta", []], ["_loadout", []]];

if (_loadout isEqualTo []) exitWith {"Failed to generate loadout summary."};

private _rifles = [_loadout, "rifle"] call BIS_fnc_getFromPairs;
private _sidearm = [_loadout, "sidearm"] call BIS_fnc_getFromPairs;
private _AR = [_loadout, "AR"] call BIS_fnc_getFromPairs;
private _MG = [_loadout, "MG"] call BIS_fnc_getFromPairs;
private _AT = [_loadout, "AT"] call BIS_fnc_getFromPairs;
private _CR = [_loadout, "CR"] call BIS_fnc_getFromPairs;

private _output = [];

switch (_structTxt) do {
  case false: {
    _output pushBack format["<font size='14'>%1</font>",_meta # 1];
    _output pushBack format["Author: %1<br/>", _meta # 2];

    _output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>PRIMARY</font>";
    _output append ([_rifles, false] call fnf_briefing_fnc_weaponDetails);
    _output append ([_sidearm, false] call fnf_briefing_fnc_weaponDetails);
    _output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>SUPPORT</font>";
    _output append ([_AR, false] call fnf_briefing_fnc_weaponDetails);
    _output append ([_MG, false] call fnf_briefing_fnc_weaponDetails);
    if !(_AT isEqualTo []) then {
      _output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>LAT</font>";
      _output append ([_AT, false] call fnf_briefing_fnc_weaponDetails);
    };
    _output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>CREW/AVIATION</font>";
    _output append ([_CR, false] call fnf_briefing_fnc_weaponDetails);
  };
  case true: {
    _output pushBack format["<t size='1.1'>%1</t>",_meta # 1];
    _output pushBack format["Author: %1<br/>", _meta # 2];

    _output pushBack "<t size='1.1' color='#e1701a' face='PuristaBold'>PRIMARY</t>";
    _output append ([_rifles, true] call fnf_briefing_fnc_weaponDetails);
    _output append ([_sidearm, true] call fnf_briefing_fnc_weaponDetails);
    _output pushBack "<t size='1.1' color='#e1701a' face='PuristaBold'>SUPPORT</t>";
    _output append ([_AR, true] call fnf_briefing_fnc_weaponDetails);
    _output append ([_MG, true] call fnf_briefing_fnc_weaponDetails);
    if !(_AT isEqualTo []) then {
      _output pushBack "<t size='1.1' color='#e1701a' face='PuristaBold'>LAT</t>";
      _output append ([_AT, true] call fnf_briefing_fnc_weaponDetails);
    };
    _output pushBack "<t size='1.1' color='#e1701a' face='PuristaBold'>CREW/AVIATION</t>";
    _output append ([_CR, true] call fnf_briefing_fnc_weaponDetails);
  };
};
_output joinString '<br/>'
