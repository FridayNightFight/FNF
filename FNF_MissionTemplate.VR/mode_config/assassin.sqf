/*
  Set the three HVT units you want to HVT_1, HVT_2, etc in the editor.

  The format for _targets is:
    ["Target X", "Objective/Role Name", "Custom name for dogtags"]
*/


_targets = [
  ["Target 1", ["Platoon Leader", "Danny Carpenter"]],
  ["Target 2", ["Second-in-Command", "Gary Jones"]],
  ["Target 3", ["Medic", "Rick Porter"]]
];

// How many of the above targets must be killed for the attackers to win
_requiredKills = 3;
