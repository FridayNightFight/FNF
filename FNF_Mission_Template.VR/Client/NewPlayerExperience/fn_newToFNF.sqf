/*
	Author: Mallen

	Description:
		starts text box's and light info for new players to show them how the game works

	Parameter(s):
		None

	Returns:
		None
*/
[{time > 1},{
	"Tutorial" hintC "Hi there! our systems show that you haven't played FNF before, this short tutorial will give you a rundown of how our custom systems work and what you can expect throughout your first match!";
	hintC_EH1 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Safe Zones" hintC ["The first thing you will interact with is likely our safe zones, these are zones at the start of the round which will keep you safe to be able to make plans with your fellow players",
	"When you are in a safe zone you wont be able to shoot your gun, throw grenades, or harm yourself in anyway, however vehicles can still take damage so be careful when driving in a safe zone!",
	"If you try and leave a safe zone before it has dropped you will be teleported back inside the zone",
	"Safe zones usually last 15 minutes at the start of the round, there will be a timer in the bottom left of your screen when the safe zones are about to drop!"];
	hintC_EH2 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Selectors" hintC ["During safe start and in your safe zones you will likely but not always have selectors to choose options for your kit and experience",
	"These selectors can be found by self ace interacting, hovering over FNF Selectors, and choosing the options you want, dont worry you can switch at anytime during safe start!",
	"When safe start ends you will be locked into your choices, so make sure you've selected the right option for you before safe start ends",
	"Importantly options selected by the selectors can't be taken off or given to other players, if you do drop what you selected you wont be able to change your selection further, so keep your stuff to yourself!"];
	hintC_EH3 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Radios" hintC ["The next thing you will want to know about is how your radios are setup and who you should be talking to!",
	"In your left ear will be your local team radio which you can talk to using the CAPS key, this will usually connect you to the people displayed in your radar at the bottom of your screen",
	"If you are a team or squad leader your long range radio in your right ear will allow you to talk to the people commanding you, usually using CTRL + CAPS, make sure you listen for any commands for your squad or team!"];
	hintC_EH4 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Objectives" hintC ["While playing you will likely have objectives to complete, these will be shown on your map in the Tasks tab on the left",
	"By clicking on an objective you'll be able to see a breif description of what it is and how to complete the objective as well as where it is located",
	"When an objective is completed or failed a notification will pop up telling you this on the right",
	"If your unsure how to complete an objective make sure to talk to players around you, they will likely know what needs to be done and can explain it for you!"];
	hintC_EH5 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Contact Staff Button" hintC ["The final thing you should know is how to contact staff in case things go wrong in game!",
	"In the ESC menu you will see a button that says 'Contact Staff' when you click this you can write a short message to describe your issue that a member of staff can come assist with",
	"Some of the things you should contact staff about include: dying via an arma glitch, getting stuck inside a rock, having a static weapon randomly destroy it self, you think someone is breaking a rule, or you need clarification about a rule",
	"Dont be afraid to use the button! If you think its a genuine problem or question staff are more than happy to help!"];
	hintC_EH6 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	"Thank You!" hintC ["That should be everything! if you have any questions feel free to ask the players around you or contact a member of staff and we hope you enjoy your first round of FNF!"];
	hintC_EH6 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH6];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH6];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH5];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH4];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH3];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH2];
	};
	}];
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH1];
	};
	}];
},[]] call CBA_fnc_waitUntilAndExecute;
