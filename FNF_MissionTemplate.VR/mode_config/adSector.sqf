_numberOfSectors = 3; //Number of sectors. 1-3
_inOrder = false; //Whether or not the sectors need to be captured in order.

/*
Attack/defend sector control mode. Attackers need to capture all sectors to win.
Sectors cannot be re-captured by defense. Only infantry can capture.
A sector is captured if there is at least one attacker in the sector and no conscious defenders.

Usage:
1. Choose how many sectors you want with the above variable.
2. Choose if you want the sectors to have to be captured in order. 1 > 2 > 3
3. Move the triggers phx_sec1, phx_sec2 and phx_sec3 to where you want. Adjust size and shape if wanted.
*/
