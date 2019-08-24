//====================================================================================================
// Scripts that need to run only after players load into the game world

if (hasInterface) then {
	// Disable AI contact reports
    player setspeaker "NoVoice";
    showSubtitles false;
    enableSentences false;
    enableRadio false;
    player disableConversation true;
};

//====================================================================================================
phx_postBriefingInitFinished = true;
