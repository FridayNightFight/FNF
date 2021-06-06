The folder and script in this archive should be placed in your Arma 3 profile > Screenshots folder. If it doesn't exist, you may need to create it. This is commonly found in one of the following two locations:
My Documents > Arma 3 > [profileName] > Screenshots
My Documents > Arma 3 - Other Profiles > [profileName] > Screenshots


In order to capture screenshots for your mission:
	1. Load your COMPLETED mission in the EDEN editor.
	2. Double-click any unit and check the "Player" box.
	3. Run the mission in SinglePlayer.
	4. Use your scroll wheel to select "Capture Objective Screenshots". If it's not present automatically, then you may be on an incompatible version of the framework.
	5. Your camera will cycle to the objectives and capture the screenshots to the above-mentioned Profile folder.
	
	
This process will also save the in-game date to your clipboard in an array. This date will be up to a week prior to your actual mission's time, to add some chronological flavor. :)

When the capturing is complete, browse to your Profile >> Screenshots folder and right-click the "processImages.ps1" script, then select "Run with Powershell". This will process the images and convert them into usable .paa texture files.

The final step is to place these .paa files into your mission folder, in a subfolder called "objectiveImages". This will ensure they're properly loaded by the game at the start of the mission.



This software is intended for use with the Friday Night Fight framework. Any use other than that outlined above may cause problems with your mission's functionality or your machine.
All rights reserved. No warranties expressed or implied.
Please contact Indigo#6290 on Discord if you run into any issues.
