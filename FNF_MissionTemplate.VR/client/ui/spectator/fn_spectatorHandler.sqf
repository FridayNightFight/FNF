params ["_control", "_side"];

[_control, _side] spawn {
	params ["_control", "_side"];
	_color = [_side] call BIS_fnc_sideColor;
	_control ctrlSetBackgroundColor _color;

	while {FNF_spectator} do {
		_count = ({alive _x && isPlayer _x} count units _side);
		if (_count > 0) then {   
            _control ctrlShow true;
            _control ctrlSetText (str _count);
        } else {
            _control ctrlShow false;
        };
		sleep 1;
	};
};
