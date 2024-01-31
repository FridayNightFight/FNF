/*
	Author: Mallen

	Description:
		Shows a screen directly simulating the map screen icons to allow viewing of info

	Parameter(s):
	  None

	Returns:
		None
*/

disableSerialization;

_display = findDisplay 60000 createDisplay "RscDisplayEmpty";

//create background
_background = _display ctrlCreate ["RscBackgroundGUI", 4251];
_background ctrlSetPosition [0,0,1,1];
_background ctrlCommit 0;

_allSubjects = allDiarySubjects player;

//setup this as essentially a makeshift hashmap as i dont know hashmaps
_indexForTree = 1;
_recordDataStorage = ["NONE FOUND"];

//create tree
_tree = _display ctrlCreate ["RscTree", 4252];
_tree ctrlSetPosition [0,0,0.3,1];
//for each diary subject
{
  _name = _x select 0;
  _displayName = _x select 1;
  _picture = _x select 2;

  //if the subject is not useless ones we dont want
  if (_name isNotEqualTo "Units" and _name isNotEqualTo "Players" and _name isNotEqualTo "Statistics" and _name isNotEqualTo "radio" and _name isNotEqualTo "cba_help_docs" and _name isNotEqualTo "Tasks" and _name isNotEqualTo "OCAP2Info") then
  {
    //add it to the root of the tree
    _tree tvAdd [[], _displayName];

    //get records of the subject
    _allRecords = player allDiaryRecords _name;

    //figure out where we just added the subject in the tree
    _currentSubjectCount = _tree tvCount [];
    _correctTreePath = [0];
    for "_i" from 0 to _currentSubjectCount do
    {
      _text = _tree tvText [_i];
      if (_text isEqualTo _displayName) then
      {
        _correctTreePath = [_i];
      };
    };

    //set picture and the info for the tree entry
    _tree tvSetPicture [_correctTreePath, _picture];
    _tree tvSetPictureColorSelected [_correctTreePath, [1,1,1,0.9]];
    _tree tvSetValue [_correctTreePath, _indexForTree];
    _recordDataStorage pushBack "NONE FOUND";
    _indexForTree = _indexForTree + 1;

    //for each record in the subject
    {
      //add record entryy to tree
      _recordName = (_x select 1);
      _tree tvAdd [_correctTreePath, _recordName];

      //find where we just inputted the tree entry
      _currentSubjectCount = _tree tvCount _correctTreePath;
      _correctTreePathRecord = [(_correctTreePath select 0),0];

      for "_i" from 0 to _currentSubjectCount do
      {
        _text = _tree tvText [(_correctTreePath select 0),_i];
        if (_text isEqualTo _recordName) then
        {
          _correctTreePathRecord = [(_correctTreePath select 0),_i];
        };
      };

      //set record data to be exact copy
      _tree tvSetValue [_correctTreePathRecord, _indexForTree];
      _recordDataStorage pushBack (_x select 2);
      _indexForTree = _indexForTree + 1;
    } forEach _allRecords;
  };

  //if the subject is tasks we cannot rely on the diary record infrastructure as it is unreliable for tasks
  if (_name isEqualTo "Tasks") then
  {

    _tree tvAdd [[], _displayName];

    _currentSubjectCount = _tree tvCount [];
    _correctTreePath = [0];
    for "_i" from 0 to _currentSubjectCount do
    {
      _text = _tree tvText [_i];
      if (_text isEqualTo _displayName) then
      {
        _correctTreePath = [_i];
      };
    };

    _tree tvSetValue [_correctTreePath, _indexForTree];
    _recordDataStorage pushBack "NONE FOUND";
    _indexForTree = _indexForTree + 1;

    //get all tasks
    _allTasks = simpleTasks player;

    _curatedTasks = [];
    _sidesWithTasks = [];

    //for each task
    {
      //get the task name and exit if task is a filler one
      _taskName = taskName _x;
      _task = _x;
      if (_taskName isEqualTo "My Tasks" or _taskName isEqualTo "Ally Tasks") then
      {
        continue;
      };

      //find obj module from task
      _objModule = objNull;
      {
        if (_x find _task isNotEqualTo -1) then
        {
          _objModule = (_x select 1);
        };
      } forEach fnf_objectives;

      //figure out what side the task is for
      _syncedObjects = synchronizedObjects _objModule;

      _objSide = sideEmpty;
      {
        _objectType = typeOf _x;
        switch (_objectType) do
        {
          case "SideBLUFOR_F":
          {
            _objSide = west;
          };
          case "SideOPFOR_F":
          {
            _objSide = east;
          };
          case "SideResistance_F":
          {
            _objSide = independent;
          };
          default
          {
            continue;
          };
        };
      } forEach _syncedObjects;

      if (_sidesWithTasks find _objSide isEqualTo -1) then
      {
        _sidesWithTasks pushBack _objSide;
      };

      _curatedTasks pushBack [_x, _objSide];
    } forEach _allTasks;

    //setup infrastructure to recieve treepaths of multiple sides
    _bluObjTreePath = [];
    _opfObjTreePath = [];
    _indObjTreePath = [];

    //if there are tasks for blufor create a tree entryy for them and find tree path for it
    if (_sidesWithTasks find west isNotEqualTo -1) then
    {
      _tree tvAdd [_correctTreePath, "Blufor"];

      _currentSubjectCount = _tree tvCount _correctTreePath;
      for "_i" from 0 to _currentSubjectCount do
      {
        _text = _tree tvText [(_correctTreePath select 0),_i];
        if (_text isEqualTo "Blufor") then
        {
          _bluObjTreePath = [(_correctTreePath select 0),_i];
        };
      };

      _tree tvSetValue [_bluObjTreePath, _indexForTree];
      _recordDataStorage pushBack "NONE FOUND";
      _indexForTree = _indexForTree + 1;
    };

    //if there are tasks for opfor create a tree entryy for them and find tree path for it
    if (_sidesWithTasks find east isNotEqualTo -1) then
    {
      _tree tvAdd [_correctTreePath, "Opfor"];

      _currentSubjectCount = _tree tvCount _correctTreePath;
      for "_i" from 0 to _currentSubjectCount do
      {
        _text = _tree tvText [(_correctTreePath select 0),_i];
        if (_text isEqualTo "Opfor") then
        {
          _opfObjTreePath = [(_correctTreePath select 0),_i];
        };
      };

      _tree tvSetValue [_opfObjTreePath, _indexForTree];
      _recordDataStorage pushBack "NONE FOUND";
      _indexForTree = _indexForTree + 1;
    };

    //if there are tasks for indfor create a tree entryy for them and find tree path for it
    if (_sidesWithTasks find independent isNotEqualTo -1) then
    {
      _tree tvAdd [_correctTreePath, "Indfor"];

      _currentSubjectCount = _tree tvCount _correctTreePath;
      for "_i" from 0 to _currentSubjectCount do
      {
        _text = _tree tvText [(_correctTreePath select 0),_i];
        if (_text isEqualTo "Indfor") then
        {
          _indObjTreePath = [(_correctTreePath select 0),_i];
        };
      };

      _tree tvSetValue [_indObjTreePath, _indexForTree];
      _recordDataStorage pushBack "NONE FOUND";
      _indexForTree = _indexForTree + 1;
    };

    //for each curated tasks with side attached
    {
      _task = _x select 0;
      _side = _x select 1;

      _name = taskName _task;
      //figure out what side it is meant to be and assign tree path based on that and add entry
      _currentTaskCorrectPath = [];
      switch (_side) do
      {
        case west:
        {
          _tree tvAdd [_bluObjTreePath , _name];
          _currentTaskCorrectPath = _bluObjTreePath;
        };
        case east:
        {
          _tree tvAdd [_opfObjTreePath , _name];
          _currentTaskCorrectPath = _opfObjTreePath;
        };
        case independent:
        {
          _tree tvAdd [_indObjTreePath , _name];
          _currentTaskCorrectPath = _indObjTreePath;
        };
        default
        {
          continue;
        };
      };

      //find the entry we just made above
      _currentSubjectCount = _tree tvCount _currentTaskCorrectPath;
      _correctTreePathCurrentTask = [];
      for "_i" from 0 to _currentSubjectCount do
      {
        _text = _tree tvText [(_currentTaskCorrectPath select 0),(_currentTaskCorrectPath select 1),_i];
        if (_text isEqualTo _name) then
        {
          _correctTreePathCurrentTask = [(_currentTaskCorrectPath select 0),(_currentTaskCorrectPath select 1),_i];
        };
      };

      _tree tvSetValue [_correctTreePathCurrentTask, _indexForTree];
      //add filler around task description to make it nicer to look at in the UI
      _recordDataStorage pushBack ("<t size='20' shadow='1' color='#FF8E38' face='PuristaBold'>" + (taskName _task) + "</t><br/><br/>" + ((taskDescription _task) select 0));
      _indexForTree = _indexForTree + 1;
    } forEach _curatedTasks;
  };
} forEach _allSubjects;
_tree ctrlCommit 0;

//add structured text and control group for text
_controlGroup = _display ctrlCreate ["RscControlsGroup", 4253];
_controlGroup ctrlSetPosition [0.3,0,0.7,1];
_controlGroup ctrlCommit 0;

_structuredText = _display ctrlCreate ["RscStructuredText", 4254, _controlGroup];
_structuredText ctrlSetPosition [0,0,0.1,0.1];
_structuredText ctrlCommit 0;

_handle = [{
  (_this select 0) params ["_tree","_structuredText","_recordDataStorage"];

  //get selection
  _selection = tvSelection _tree;

  //get value assigned to selection
  _value = _tree tvValue (_selection select 0);

  //get the data for the value
  _currentText = _recordDataStorage select _value;
  //if data is not empty
  if (_currentText isNotEqualTo "NONE FOUND") then
  {

    //use complicated find replace algorithm to replace "font" with "t" due to different standards for structured text between GUI elements and diary records
    _splitString = [_currentText, "font", true] call BIS_fnc_splitString;
    _editedStringFontChanged = _splitString select 0;
    _splitString deleteAt 0;
    {
      _editedStringFontChanged = _editedStringFontChanged + "t" + _x;
    } forEach _splitString;

    //similarly edit values to properly scale text size and image sizes
    _splitString = [_editedStringFontChanged, "'"] call BIS_fnc_splitString;
    _editedStringSizeFixed = _splitString select 0;
    _prevText = _splitString select 0;
    _splitString deleteAt 0;
    {
      if (["size=", _prevText] call BIS_fnc_inString) then
      {
        _num = parseNumber _x;
        if (_num isNotEqualTo 0) then
        {
          _num = _num * 0.1;
          _editedStringSizeFixed = _editedStringSizeFixed + "'" + str(_num);
          _prevText = _x;
          continue;
        };
      };
      if (["width=", _prevText] call BIS_fnc_inString) then
      {
        _num = parseNumber _x;
        if (_num isNotEqualTo 0) then
        {
          _num = _num * 0.025;
          _editedStringSizeFixed = _editedStringSizeFixed + "'" + str(_num);
          _prevText = _x;
          continue;
        };
      };
      _editedStringSizeFixed = _editedStringSizeFixed + "'" + _x;
      _prevText = _x;
    } forEach _splitString;

    //edit the word width and replace with size due to more differences
    _splitString = [_editedStringSizeFixed, "width=", true] call BIS_fnc_splitString;
    _editedStringWidthChanged = _splitString select 0;
    _splitString deleteAt 0;
    {
      _editedStringWidthChanged = _editedStringWidthChanged + "size=" + _x;
    } forEach _splitString;

    //set text and update size
    _structuredText ctrlSetStructuredText (parseText _editedStringWidthChanged);
    _structuredText ctrlSetPosition [0,0,0.7,ctrlTextHeight _structuredText];
    _structuredText ctrlCommit 0;
  };
},0,[_tree, _structuredText, _recordDataStorage]] call CBA_fnc_addPerFrameHandler;

//add EH to delete PFH when menu is closed
fnf_missionDetailsPFH = _handle;

_display displayAddEventHandler ["Unload", {
  [fnf_missionDetailsPFH] call CBA_fnc_removePerFrameHandler;
}];
