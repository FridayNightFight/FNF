//Only run client-side
if (!hasInterface) exitWith {};

#include "..\..\mode_config\destroy.sqf"

_objArr = [_obj1,_obj2,_obj3];

fnf_destroyObjs = [_obj1 select 0, _obj2 select 0, _obj3 select 0];

{
  if (_x call BIS_fnc_objectType select 1 == "Thing") then {

    //When the player hits the objective, get a hit value for that hit and send it to the server
    _x addEventHandler ["HitPart", {
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
    _x addEventHandler ["Explosion", {
  	   params ["_vehicle", "_damage", "_source"];

       _type = typeOf _source;
       _configParents = [configFile >> "CfgAmmo" >> _type, true] call BIS_fnc_returnParents;
       _damage = 1000;

       if ("PipeBombBase" in _configParents) then {_damage = 2000};
       if ("GrenadeHand" in _configParents) then {_damage = 750};

       if (_type in ["SatchelCharge_Remote_Ammo","ACE_SatchelCharge_Remote_Ammo_Thrown"]) then {_damage = 5000};
       if (_type in ["DemoCharge_Remote_Ammo","ACE_DemoCharge_Remote_Ammo_Thrown"]) then {_damage = 2000};

       _damage = _damage / ((_vehicle distance _source) / 2);

       [_vehicle, round _damage] remoteExec ["fnf_destroy_server_fnc_registerHit",2];
    }];
  };
} forEach fnf_destroyObjs;

if (playerSide != fnf_defendingSide) exitWith {};

{
  _obj = _x select 0;
  _mark = _x select 1;
  if (!isNull _obj) then {
    _mark setMarkerAlphaLocal 0;
  };
} forEach _objArr;
