// this script is called from a "Local" EH on vehicles.
// it's used to reapply invincibility to vehicles on locality switch
// if a player is in a protection zone, it will ensure the vehicle is also made invincible if it switches locality
// to this client.
params ["_entity", "_isLocal"];

if (_entity isKindOf "CAManBase") exitWith {};

if (_entity getVariable ["fnf_zoneProtectionActive", false] && _isLocal) then {
  _entity allowDamage false;
} else {
  _entity allowDamage true;
};
true
