params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

// "debug_console" callExtension ("Launcher fired");

phx_server_playRocketSiren = {
	params ["_unit", "_ammo"];
	_startTime = time;
	_projectile = (position _unit nearObjects [_ammo,250]) select 0;
	while {(time - _startTime) < 30} do {
		if (time % 5 < 1) then {
			playSound3D [
				"A3\Sounds_F\sfx\siren.wss", // filename
				_unit, // soundSource
				false, // isInside
				getposasl _unit, // soundPosition
				5, // volume
				1, // soundPitch
				([0,0] distance2d [worldSize,worldSize]) // distance 
			];
			uiSleep 1;
		};
	};
};

if (isServer) then {
	[_unit, _ammo] spawn phx_server_playRocketSiren;
};
if (hasInterface) then {
	["<t align='center' size='1.75' face='EtelkaMonospacePro'><t size='2.5' face='EtelkaMonospaceProBold' color='#EE3333'>WARNING</t><br/>SCUD launch detected.</t>", "error", 20] call phx_ui_fnc_notify;
};