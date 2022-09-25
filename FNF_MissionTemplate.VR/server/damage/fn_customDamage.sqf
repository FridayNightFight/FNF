/*
Creates a custom damage system for destroy objective objects that are not normally damageable.
*/

if (!hasInterface) exitWith {};

params ["_object"];

//When the player hits the objective, get a hit value for that hit and send it to the server
_object addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

  //Create a cache for hit events so the server isn't spammed with messages for every hit
  if (scriptDone (missionNamespace getVariable ["fnf_destroy_hitCache",scriptNull])) then {
    fnf_destroy_hitCache = _target spawn {
      _target = _this;
      sleep 0.15;

      [_target, _target getVariable ["hitCache",0], false] remoteExec ["fnf_destroy_server_fnc_registerHit",2];
      _target setVariable ["hitCache",0];
    };
  };

  _hitValue = _ammo select 0;
  _target setVariable ["hitCache", _hitValue + (_target getVariable ["hitCache",0])];
}];

//Handle explosion damage for objective and send hit damage value to the server
_object addEventHandler ["Explosion", {
   params ["_vehicle", "_damage", "_source"];

   private ["_distance","_sourcePos"];
   private _type = typeOf _source;
   private _configParents = [configFile >> "CfgAmmo" >> _type, true] call BIS_fnc_returnParents;
   private _objectCorners = (_vehicle call BIS_fnc_boundingBoxCorner) apply {ATLToASL _x};
   private _closestDistance = _source distance2d _vehicle; //default distance in case it fails to be calculated
   private _damage = 1000; //default damage
   private _dmgFalloffDistance = 0.3; //default

   _sourcePos = (getPosASL _source) vectorAdd [0,0,0.2]; //Raise the line intersect start position up a bit so it doesn't get occluded by terrain

   {
     _distance = _sourcePos distance ((lineIntersectsSurfaces [_sourcePos, _x]) select {_vehicle in _x} select 0 select 0);
     if (_forEachIndex == 0 || _distance < _closestDistance) then {_closestDistance = _distance};
   } forEach (_objectCorners + (_objectCorners apply {_x vectorAdd [0,0,5]}) + [getPosASL _vehicle] + [(getPosASL _vehicle) vectorAdd [0,0,0.1]]);

   if ("PipeBombBase" in _configParents) then {_damage = 3000};
   if ("GrenadeHand" in _configParents) then {_damage = 400};

   if (_type in ["SatchelCharge_Remote_Ammo","ACE_SatchelCharge_Remote_Ammo_Thrown"]) then {_damage = 8000; _dmgFalloffDistance = 2.75};
   if (_type in ["DemoCharge_Remote_Ammo","ACE_DemoCharge_Remote_Ammo_Thrown"]) then {_damage = 3000; _dmgFalloffDistance = 1.5};

   if (_closestDistance > _dmgFalloffDistance) then {
     _damage = _damage / (exp (_closestDistance - _dmgFalloffDistance));
   };

   if (isServer) then {hint format ["Destroy Explosive Damage Debug:\nObject: %3 \nDistance: %1 \nDamage: %2", _closestDistance, _damage, _vehicle]};

   [_vehicle, _damage, true] remoteExec ["fnf_destroy_server_fnc_registerHit",2];
}];
