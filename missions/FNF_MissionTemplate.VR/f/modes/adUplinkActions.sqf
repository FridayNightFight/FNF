eastStartHack1 = {
  [
  term1,                                                                               // Object the action is attached to
  "Start Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == east) && !gameEnd && !term1Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Started"] call BIS_fnc_showSubtitle; term1Hacking = true; publicVariable "term1Hacking";[term1,true] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  5,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
eastStartHack2 = {
  [
  term2,                                                                               // Object the action is attached to
  "Start Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == east) && !gameEnd && !term2Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Started"] call BIS_fnc_showSubtitle; term2Hacking = true; publicVariable "term2Hacking";[term2,true] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  5,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
eastStopHack1 = {
  [
  term1,                                                                               // Object the action is attached to
  "Pause Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == east) && !gameEnd && term1Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Pausing Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Paused"] call BIS_fnc_showSubtitle;term1Hacking = false;publicVariable "term1Hacking";[term1,false] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  1,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
eastStopHack2 = {
  [
  term2,                                                                               // Object the action is attached to
  "Pause Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == east) && !gameEnd && term2Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Pausing Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Paused"] call BIS_fnc_showSubtitle;term2Hacking = false;publicVariable "term2Hacking";[term2,false] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  1,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
westStartHack1 = {
  [
  term1,                                                                               // Object the action is attached to
  "Start Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == west) && !gameEnd && !term1Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Started"] call BIS_fnc_showSubtitle; term1Hacking = true; publicVariable "term1Hacking";[term1,true] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  5,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
westStartHack2 = {
  [
  term2,                                                                               // Object the action is attached to
  "Start Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == west) && !gameEnd && !term2Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Started"] call BIS_fnc_showSubtitle; term2Hacking = true; publicVariable "term2Hacking";[term2,true] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  5,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
westStopHack1 = {
  [
  term1,                                                                               // Object the action is attached to
  "Pause Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == west) && !gameEnd && term1Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Pausing Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Paused"] call BIS_fnc_showSubtitle;term1Hacking = false;publicVariable "term1Hacking";[term1,false] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  1,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
westStopHack2 = {
  [
  term2,                                                                               // Object the action is attached to
  "Pause Hack",                                                                        // Title of the action
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
  "(_this distance _target < 3) && (side player == west) && !gameEnd && term2Hacking",// Condition for the action to be shown
  "_caller distance _target < 3",                                                      // Condition for the action to progress
  {["Terminal", "Pausing Hack"] call BIS_fnc_showSubtitle},                        // Code executed when action starts
  {},                                                                                  // Code executed on every progress tick
  {["Terminal", "Hack Paused"] call BIS_fnc_showSubtitle;term2Hacking = false;publicVariable "term2Hacking";[term2,false] remoteExec ["handleTerminals",2,false]},// Code executed on completion
  {["Terminal", ""] call BIS_fnc_showSubtitle},                                        // Code executed on interrupted
  [],                                                                                  // Arguments passed to the scripts as _this select 3
  1,                                                                                   // Action duration [s]
  0,                                                                                   // Priority
  false,                                                                                // Remove on completion
  false                                                                                // Show in unconscious state
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};
