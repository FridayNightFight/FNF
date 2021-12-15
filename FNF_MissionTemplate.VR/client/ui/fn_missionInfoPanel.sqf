h = [] spawn {
  disableSerialization;

  // _display = findDisplay 46 createDisplay "RscDisplayEmpty";
  createDialog "RscDisplayEmpty";
  _display = (findDisplay -1);
  _tree = _display ctrlCreate [ "ctrlTree", 100 ];
  _tree ctrlSetPosition[ 0, -0.25, 0.35, 1.5 ];
  _tree ctrlSetBackgroundColor [0,0,0,0.8];
  _tree ctrlCommit 0;
  _textBox = _display ctrlCreate [ "ctrlStructuredText", 101 ];
  _textBox ctrlSetPosition[ 0.35, -0.25, 0.65, 1.5 ];
  _textBox ctrlSetBackgroundColor [0,0,0,0.8];
  _textBox ctrlCommit 0;




  _MATSettingsIndex = _tree tvAdd [[],"MAT Settings"];

  _BLUFORIndex = _tree tvAdd [[],"BLUFOR"];
  _BLUFORIndexUniform = _tree tvAdd [[_BLUFORIndex],"Uniform"];
  _BLUFORIndexLoadout = _tree tvAdd [[_BLUFORIndex],"Loadout"];
  _BLUFORIndexAssets = _tree tvAdd [[_BLUFORIndex],"Assets"];
  _OPFORIndex = _tree tvAdd [[],"OPFOR"];
  _OPFORIndexUniform = _tree tvAdd [[_OPFORIndex],"Uniform"];
  _OPFORIndexLoadout = _tree tvAdd [[_OPFORIndex],"Loadout"];
  _OPFORIndexAssets = _tree tvAdd [[_OPFORIndex],"Assets"];
  _INDFORIndex = _tree tvAdd [[],"INDFOR"];
  _INDFORIndexUniform = _tree tvAdd [[_INDFORIndex],"Uniform"];
  _INDFORIndexLoadout = _tree tvAdd [[_INDFORIndex],"Loadout"];
  _INDFORIndexAssets = _tree tvAdd [[_INDFORIndex],"Assets"];

  _OtherAssetsIndex = _tree tvAdd [[],"Other Assets"];

  {
    _tree tvAdd [[_BLUFORIndex, _BLUFORIndexAssets], _x # 0];
  } forEach phx_ui_structTextRef_AssetsBLU;
  {
    _tree tvAdd [[_OPFORIndex, _OPFORIndexAssets], _x # 0];
  } forEach phx_ui_structTextRef_AssetsOPF;
  {
    _tree tvAdd [[_INDFORIndex, _INDFORIndexAssets], _x # 0];
  } forEach phx_ui_structTextRef_AssetsIND;
  {
    _tree tvAdd [[_OtherAssetsIndex], _x # 0];
  } forEach phx_ui_structTextRef_AssetsOther;



  _tree ctrlAddEventHandler [ "TreeSelChanged", {
    params[ "_tree", "_path" ];
    // "debug_console" callExtension str(_this);
    // _pathLabels = _path apply {_tree tvText [_x]};

    _selected = "";
    {
      // _selected = format["%1 %2",
      //   _selected, //Any previous text
      //   // [ "", ">>" ]select( _forEachIndex > 0 ), //Add >> only after first path item
      //   ( _tree tvText ( _path select [ 0, _forEachIndex + 1 ] )) //tree items displayed text
      // ];
      if (_forEachIndex > 0) then {
        _selected = _selected + " ";
      };
      _selected = _selected + ( _tree tvText ( _path select [ 0, _forEachIndex + 1 ] ));
    } forEach _path;


    private ["_data", "_prefix"];

    if (["Assets ", _selected] call BIS_fnc_inString) then {
      switch (true) do {
        case (["BLUFOR", _selected] call BIS_fnc_inString): {
          _data = +phx_ui_structTextRef_AssetsBLU;
          _prefix = "BLUFOR Assets ";
        };
        case (["OPFOR", _selected] call BIS_fnc_inString): {
          _data = +phx_ui_structTextRef_AssetsOPF;
          _prefix = "OPFOR Assets ";
        };
        case (["INDFOR", _selected] call BIS_fnc_inString): {
          _data = +phx_ui_structTextRef_AssetsIND;
          _prefix = "INDFOR Assets ";
        };
        default {
          _data = +phx_ui_structTextRef_AssetsOther;
          _prefix = "Other Assets ";
        }
      };
    } else {
      _data = +phx_ui_structTextRef;
    };

    private _textBox = ((ctrlParent _tree) displayCtrl 101);
    if (!isNil "_prefix") then {_selected = ([_selected, _prefix, true] call BIS_fnc_splitString) # 1};
    private _toLoad = [_data, _selected] call BIS_fnc_getFromPairs;
    if (isNil "_toLoad") then {
      _textBox ctrlSetStructuredText parseText "<t size='3'>NO DATA</t>"
    } else {
      _textBox ctrlSetStructuredText parseText _toLoad;
      // private _ctrlPos = ctrlPosition _textBox;
      // private _height = ctrlTextHeight _textBox;
      // _ctrlPos set [3,_height min (safezoneH - (_ctrlPos select 1) + 0.2)];
      // _textBox ctrlSetPosition _ctrlPos;
      // _textBox ctrlCommit 0;
    };

    // hint format[ "You Selected\n%1", _selected ]; //eg "PARENT 1 >> CHILD 2"
  }];

};
