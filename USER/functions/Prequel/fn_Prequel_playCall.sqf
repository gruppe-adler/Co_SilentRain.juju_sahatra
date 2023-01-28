params ["_call"];

switch (_call) do {
	case "food_call": {
		playSound "food_call";
		[
			["Abed", "Killer Kebab, iraqi cuisine since 1972. This is Abed, how may I help you?", 7],
			["Lord Quasim", "Abed, this is Lord Qasim. I would like to order the 'fiery falafel special' with extra tahini. As soon as possible and the usual address in Nasul.", 14.5],
			["Abed", "Of course Lord Qasim, I will dispatch a driver immediately!", 24],
			["", "", 30]
		] spawn BIS_fnc_EXP_camp_playSubtitles; // displays 4 subtitles with 5 seconds between them
		
		sleep 29;		
	};
};

BIS_fnc_EXP_camp_playSubtitles_terminate = true; // closes subtitles