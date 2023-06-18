params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

// "debug_console" callExtension ("Launcher fired");

fnf_server_playRocketSiren = {
	params ["_unit", "_ammo"];
	_projectile = (position _unit nearObjects [_ammo,250]) select 0;
	for "_i" from 1 to 12 do {
		playSound3D [
			"A3\Sounds_F\sfx\siren.wss", // filename
			_unit, // soundSource
			false, // isInside
			getposasl _unit, // soundPosition
			3, // volume
			1, // soundPitch
			10000 // distance
		];
		sleep 1.2;
	};
};

if (isServer) then {
	[_unit, _ammo] spawn fnf_server_playRocketSiren;
};
if (hasInterface) then {
	["<t align='center' size='1.75' face='EtelkaMonospacePro'><t size='2.5' face='EtelkaMonospaceProBold' color='#EE3333'>WARNING</t><br/>SCUD launch detected.</t>", "error", 20] call fnf_ui_fnc_notify;
};
