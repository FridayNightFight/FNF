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
      sleep 1;

      [_target, _target getVariable ["hitCache",0]] remoteExec ["fnf_destroy_server_fnc_registerHit",2];
      _target setVariable ["hitCache",0];
    };
  };

  _hitValue = _ammo select 0;
  _target setVariable ["hitCache", _hitValue + (_target getVariable ["hitCache",0])];
}];

//Handle explosion damage for objective and send hit damage value to the server
_object addEventHandler ["Explosion", {
   params ["_vehicle", "_damage", "_source"];

   private "_distance";
   private _type = typeOf _source;
   private _configParents = [configFile >> "CfgAmmo" >> _type, true] call BIS_fnc_returnParents;
   private _distance = (getPosASLVisual _source) distance2d ((lineIntersectsSurfaces [getPosASLVisual _source, getPosASLVisual _vehicle]) select {_vehicle in _x} select 0 select 0);
   private _damage = 1000; //default damage
   private _dmgFalloffDistance = 0.75; //default

   if (isNil "_distance") then {_distance = _source distance2d _vehicle;};

   if ("PipeBombBase" in _configParents) then {_damage = 3000};
   if ("GrenadeHand" in _configParents) then {_damage = 400; _dmgFalloffDistance = 0.5};

   if (_type in ["SatchelCharge_Remote_Ammo","ACE_SatchelCharge_Remote_Ammo_Thrown"]) then {_damage = 8000; _dmgFalloffDistance = 2.5};
   if (_type in ["DemoCharge_Remote_Ammo","ACE_DemoCharge_Remote_Ammo_Thrown"]) then {_damage = 3000; _dmgFalloffDistance = 1};

   if (_distance > _dmgFalloffDistance) then {_damage = _damage / (_distance ^ 1.7)};

   //hint format ["Object: %3 \nDistance: %1 \nDamage: %2", _distance, _damage, _vehicle];

   [_vehicle, round _damage] remoteExec ["fnf_destroy_server_fnc_registerHit",2];
}];
