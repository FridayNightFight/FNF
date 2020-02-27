selectorEnabled = false;

player removeAction gearAction;

_display = findDisplay 2000;
if (!isNull _display) then {
  _display closeDisplay 1;
};

if (!isNil "leadAction") then {
  player removeAction leadAction;
  _display = findDisplay 5000;
  if (!isNull _display) then {
    _display closeDisplay 1;
  };
};
