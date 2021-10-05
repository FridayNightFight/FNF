private _loadout = param [0];
private _rifles = [_loadout, "rifle"] call BIS_fnc_getFromPairs;
private _sidearm = [_loadout, "sidearm"] call BIS_fnc_getFromPairs;
private _AR = [_loadout, "AR"] call BIS_fnc_getFromPairs;
private _MG = [_loadout, "MG"] call BIS_fnc_getFromPairs;
private _AT = [_loadout, "AT"] call BIS_fnc_getFromPairs;
private _SNP = [_loadout, "SNP"] call BIS_fnc_getFromPairs;
private _RS = [_loadout, "RS"] call BIS_fnc_getFromPairs;
private _P = [_loadout, "P"] call BIS_fnc_getFromPairs;

private _output = [];

_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>PRIMARY</font>";
_output append (_rifles call phx_fnc_briefingWeaponDetails);
_output append (_sidearm call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>SUPPORT</font>";
_output append (_AR call phx_fnc_briefingWeaponDetails);
_output append (_MG call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>LAT</font>";
_output append (_AT call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>RECON</font>";
_output append (_SNP call phx_fnc_briefingWeaponDetails);
_output append (_RS call phx_fnc_briefingWeaponDetails);
_output pushBack "<font size='18' color='#e1701a' face='PuristaBold'>AVIATION</font>";
_output append (_P call phx_fnc_briefingWeaponDetails);
_output joinString '<br/>'