_controls = _this;

waitUntil {isNull findDisplay 2000};

{
  _x ctrlRemoveAllEventHandlers "LBSelChanged";
  } forEach _controls;
