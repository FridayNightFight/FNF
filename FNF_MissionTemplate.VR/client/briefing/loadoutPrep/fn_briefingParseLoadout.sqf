params ["_meta", ["_loadout", []]];

if (_loadout isEqualTo []) exitWith {"Failed to generate loadout summary."};

private _rifles = [_loadout, "rifle"] call BIS_fnc_getFromPairs;
private _sidearm = [_loadout, "sidearm"] call BIS_fnc_getFromPairs;
private _AR = [_loadout, "AR"] call BIS_fnc_getFromPairs;
private _MG = [_loadout, "MG"] call BIS_fnc_getFromPairs;
private _AT = [_loadout, "AT"] call BIS_fnc_getFromPairs;
private _SNP = [_loadout, "SNP"] call BIS_fnc_getFromPairs;
private _RIS = [_loadout, "RIS"] call BIS_fnc_getFromPairs;
private _CR = [_loadout, "CR"] call BIS_fnc_getFromPairs;

private _output = [];

_output pushBack format["<font size='14'>%1</font>",_meta # 1];
_output pushBack format["Author: %1<br/>", _meta # 2];

_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>PRIMARY</font>";
_output append (_rifles call phx_fnc_briefingWeaponDetails);
_output append (_sidearm call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>SUPPORT</font>";
_output append (_AR call phx_fnc_briefingWeaponDetails);
_output append (_MG call phx_fnc_briefingWeaponDetails);
if !(_AT isEqualTo []) then {
  _output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>LAT</font>";
  _output append (_AT call phx_fnc_briefingWeaponDetails);
};
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>RECON</font>";
_output append (_SNP call phx_fnc_briefingWeaponDetails);
_output append (_RIS call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>CREW/AVIATION</font>";
_output append (_CR call phx_fnc_briefingWeaponDetails);
_output joinString '<br/>'
