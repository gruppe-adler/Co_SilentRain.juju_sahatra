params ["_call"];

[
	{
		diwako_dui_main_toggled_off = true;
	},
	[],
	6
] call CBA_fnc_waitAndExecute;

switch (_call) do {
	case "food_call": {
		playSound "food_call";
		[
			["Abed", "Killer Kebab, iraqi cuisine since 1972. This is Abed, how may I help you?", 7],
			["Lord Quasim", "Abed, this is Lord Qasim. I would like to order the 'fiery falafel special' with extra tahini. As soon as possible and the usual address in Nisul.", 14.5],
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

	case "evac_call_combat": {
		playSound "evac_call_combat";
		[
			["Bodyguard", "The compound is under attack, I repeat, the compound is under attack! We need to get Qasim out of here now!", 6.5],
			["Sahatra Base", "Understood, what kind of contact?", 14.5],
			["Bodyguard", "Seems like only infantry to me! Now hurry the fuck up!", 17.5],
			["Sahatra Base", "Copy! EVAC is on its way; ETA: 5 mike!", 22.5],
			["", "", 30]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
		
		sleep 28;
	};

	case "evac_call_normal": {
		playSound "evac_call_normal";
		[
			["Sahatra Base", "This is Sahatra Base. Lord Qasim, how can we help you?", 6.5],
			["Qasim", "I need a transport back to Sahatra. The meeting with Colonel Amir is in an hour and i need some time to prepare.", 11],
			["Sahatra Base", "Of course! A convoy is on its way and will arrive in about 5 minutes.", 17.5],
			["", "", 23]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
		
		sleep 23;
	};	
};

BIS_fnc_EXP_camp_playSubtitles_terminate = true; // closes subtitles
diwako_dui_main_toggled_off = false;