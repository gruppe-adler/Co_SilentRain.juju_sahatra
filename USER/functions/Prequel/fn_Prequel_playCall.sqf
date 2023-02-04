params ["_call"];

switch (_call) do {
	case "food_call": {
		playSound "food_call";
		[
			["Abed", "Killer Kebab, iraqi cuisine since 1972. This is Abed, how may I help you?", 7],
			["Lord Quasim", "Abed, this is Lord Qasim. I would like to order the 'fiery falafel special' with extra tahini. As soon as possible and the usual address in Nasul.", 14.5],
			["Abed", "Of course Lord Qasim, I will dispatch a driver immediately!", 24],
			["", "", 30]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
		
		sleep 29;
	};
	case "escort_call": {
		playSound "escort_call";
		[
			["Nadia", "Salem Qasim.", 6.5],
			["Lord Quasim", "Salam Alaikum Nadia.", 8],
			["Nadia", "Qasim, I really long to see you. Can I come over for a bit?", 9.5],
			["Lord Qasim", "Nadia, my palm tree is thirsty. Let me throw out my visitors and I should be free in a few minutes.", 15],
			["Nadia", "Rain will come my dear, I promise. See you soon!", 22],
			["Lord Qasim", "See you in a bit, my beauty", 27],
			["", "", 33]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
		
		sleep 30;
	};	
};

BIS_fnc_EXP_camp_playSubtitles_terminate = true; // closes subtitles