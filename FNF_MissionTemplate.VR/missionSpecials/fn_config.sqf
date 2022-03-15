if !(isServer) exitWith {};

/////////////////////////////////////////////////////
// CONFIGURE HERE //
/////////////////////////////////////////////////////

_settings = [
  ["ambientAirdrop", [
    true, // is enabled
    [
      45, // bearing of travel for WEST/BLUFOR planes
      300 // bearing of travel for EAST/OPFOR planes
    ],
    4, // numPlanes: number of planes to spawn (adds lateral spread to the formation - keep this in mind when setting dropSpread
    500 // dropSpread: how wide of an area around the marker boxes will drop in
  ]]
];




/////////////////////////////////////////////////////
// INFORMATION //
/////////////////////////////////////////////////////
/*

// AMBIENT AIRDROP //

This tool will let you place 1 or more markers on the map for spots you want an airdrop to happen in.
OPFOR markers will use Antonov AN-2s. BLUFOR markers will use C-130Js.
The items dropped will be a mix of boxes and barrels to represent general logistics supplies.
Marker names:
  fnf_ambientAirdrop_east_N | (OPFOR)
  fnf_ambientAirdrop_west_N | (BLUFOR)






*/




/////////////////////////////////////////////////////
// DO NOT MODIFY BELOW THIS LINE //
/////////////////////////////////////////////////////

// [_settings, false] call CBA_fnc_hashCreate;
// fnf_missionSpecials = [_settings] call CBA_fnc_deserializeNamespace;

private _activatedSpecials = [];
{
  _x params ["_key", "_value"];
  if (_value#0) then {
    _activatedSpecials pushBack _key;
    _fnc = missionNamespace getVariable format["fnf_missionSpecials_fnc_%1", _key];
    _value spawn _fnc;
  };
} forEach _settings;

if (count _activatedSpecials > 0 && is3DENPreview) then {
  format["[FNF] [PreviewOnly] Active specials: %1", _activatedSpecials] remoteExec ["systemChat", 0, true];
};