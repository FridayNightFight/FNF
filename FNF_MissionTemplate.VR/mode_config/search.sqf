_numberOfTerminals = 3;
// Number of terminal objectives. Value = 1, 3, or 5
// You can place all 5 but leave this value at 3 or 1 for random selection
_randomSelection = false; // KEEP FALSE FOR NOW, NOT IMPLEMENTED

_pointAddTime = 40;
// How often points are added for each controlled terminal, in seconds.

phx_searchMarkAreaStartRadius = 500;
// How large the starting area of the marking circle is

/*
====================================================================================================
search - neutral

Description:
Neutral objectives that sides need to control. For each controlled objective, a side gets 1 point every _pointAddTime.

Usage:
1. Choose if you want 2 or 3 terminals
2. Move the terminals to new locations
====================================================================================================
*/
