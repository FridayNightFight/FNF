#setGroupID
This module sets up groups with various variables such as names and types (`gpsmarkers`) as well as radio frequencies (`radios`).

###Configure
Each group is defined in a giant array at the top of the file. Each array is separated by a comma with the last array not having a comma after it. Each array uses the following format:

`[group,groupID,phx_LongName,unitSize,radioSettings]`

Each of the words above is explained below:

`group` is defined by placing a line similar to the following in the initialization field of every unit in that group: `Blue_A1 = group this;`.

`groupID` is a short string used to identify a group: `"A1"`

`phx_LongName` is a longer version of `groupID` used to identify the group: `Alpha One`

`unitSize` is a number telling what level the group is. Company = 3, Platoon = 2, Squad = 1, Fireteam = 0 (0-3)

`radioSettings`: Tells radio script which channels to set for group. 
Uses the format: `[mainChannel,altchannel,[channelArray]]` (array)

Each of the above is explained below:

```
mainChannel: Which channel the radio will start on. (1-8)
altChannel: Which channel the radio will have as an alternate by default (1-8)
[channelArray]: An array of channels to set on the radio. (float)
   The first value in channelArray is the value for Channel Two, the second value is Channel Three, and so on... Channel 1 is always equal to playerBaseChannel (an offset of zero).
   Each value in channelArray is added to playerBaseChannel (ch1). The sum of those two values is the frequency that gets programmed into the players radio for that channel. 
   Try to keep offsets single digit so there are no problems setting them on player radios. Backpack radios can only set frequencies from 30-87. Short-range radios can only set frequencies from 30-512.
   Frequencies can only have one decimal place.
ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.
```
    
###Disable
In `'/f/init/fn_init_client.sqf'` remove the line: ```[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";```.

###Other
If you see a message that says ```[setGroupIDs] No radio freq found for group - '[GROUP NAME]'``` it means that in your group definitions you have set the `mainChannel` variable to a number higher than the amount of values defined in that group's `channelArray`. This message is displayed when the ORBAT script `f/briefing/f_orbatNotes.sqf` is unable to display a frequency next to the name of the listed group.
