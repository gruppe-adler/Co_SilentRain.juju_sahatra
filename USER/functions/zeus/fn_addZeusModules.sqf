//// CALLS
[
	"Silent Rain Calls",
	"Start Escort Call",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["escort_call"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["escort_call"] spawn grad_SR_fnc_Prequel_playCall;
		};
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Calls",
	"Start Food Call",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["food_call"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["food_call"] spawn grad_SR_fnc_Prequel_playCall;
		};
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Calls",
	"Start EVAC Call (Combat)",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["evac_call_combat"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["evac_call_combat"] spawn grad_SR_fnc_Prequel_playCall;
		};

		[
			{
				// [] call grad_SR_fnc_Prequel_initEvac;
				switch (GRAD_WARLORD_POSITION) do {
					case 1: {
						[
							{
								[] call grad_SR_fnc_Prequel_initEvacPos1;
							},
							[],
							210
						] call CBA_fnc_waitAndExecute;
					};
					case 2: {
						[
							{
								[] call grad_SR_fnc_Prequel_initEvacPos2;
							},
							[],
							220
						] call CBA_fnc_waitAndExecute;
					};
					case 3: {
						[] call grad_SR_fnc_Prequel_initEvacPos3;
					};					
				};
			},
			[],
			30
		] call CBA_fnc_waitAndExecute;
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Calls",
	"Start EVAC Call (Normal)",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["evac_call_normal"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["evac_call_normal"] spawn grad_SR_fnc_Prequel_playCall;
		};

		[
			{
				// [] call grad_SR_fnc_Prequel_initEvac;
				switch (GRAD_WARLORD_POSITION) do {
					case 1: {
						[
							{
								[] call grad_SR_fnc_Prequel_initEvacPos1;
							},
							[],
							210
						] call CBA_fnc_waitAndExecute;
					};
					case 2: {
						[
							{
								[] call grad_SR_fnc_Prequel_initEvacPos2;
							},
							[],
							220
						] call CBA_fnc_waitAndExecute;
					};
					case 3: {
						[] call grad_SR_fnc_Prequel_initEvacPos3;
					};
				};
			},
			[],
			25
		] call CBA_fnc_waitAndExecute;
	}
] call zen_custom_modules_fnc_register;



//// SPAWNS

[
	"Silent Rain Spawns",
	"Start Killerkebap Car",
	{ 
		params ["_modulePosition"]; 
		
		[GRAD_Approach_1] call grad_SR_fnc_killerKebap_spawnCar;
	}
] call zen_custom_modules_fnc_register;


[
	"Silent Rain Spawns",
	"Spawn Hooker",
	{ 
		params ["_modulePosition"]; 
		private _position = ASLtoAGL _modulePosition;
		
		[_position] remoteExec ["grad_SR_fnc_hooker_spawn", 2];
	}
] call zen_custom_modules_fnc_register;


[
	"Silent Rain Spawns",
	"Spawn Female Civ",
	{ 
		params ["_modulePosition"]; 
		private _position = ASLtoAGL _modulePosition;
		
		[_position, false] remoteExec ["grad_SR_fnc_identity_spawnCiv", 2];
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Spawns",
	"Spawn Male Civ",
	{ 
		params ["_modulePosition"]; 
		private _position = ASLtoAGL _modulePosition;
		
		[_position, true] remoteExec ["grad_SR_fnc_identity_spawnCiv", 2];
	}
] call zen_custom_modules_fnc_register;



["Silent Rain Spawns", "Music Radio",
    {
      // Get all the passed parameters
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_SR_fnc_ambient_radioSpawn", 2];

    }] call zen_custom_modules_fnc_register;


["Silent Rain Spawns", "Create Mosque Singer",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_SR_fnc_ambient_createMosqueSinger", 2];

    }] call zen_custom_modules_fnc_register;

["Silent Rain Spawns", "Create Music Carrier",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_SR_fnc_ambient_createMusicCarrier", 2];

    }] call zen_custom_modules_fnc_register;





/// MISSION START 

[
	"Silent Rain Start",
	"Execute Drop Sequence",
	{ 
		params ["_modulePosition"]; 
		
		[] remoteExec ["grad_drop_fnc_haloJumpExecute", 2];
	}
] call zen_custom_modules_fnc_register;


[
	"Silent Rain Start",
	"Time Jump to Morning",
	{ 
		params ["_modulePosition"]; 
		
		[] remoteExec ["grad_drop_fnc_timeJump", [0,-2] select isDedicated];
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Start",
	"Jump Master Greeting Start",
	{ 
		params ["_modulePosition"]; 
		
		[] remoteExec ["grad_drop_fnc_jumpMasterGreetingLoop", 2];
	}
] call zen_custom_modules_fnc_register;


[
	"Silent Rain Start",
	"Jump Master Greeting Stop",
	{ 
		params ["_modulePosition"]; 
		
		missionNameSpace setVariable ["GRAD_drop_jmGreeting", false, true];
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain Start",
	"Player Exfil",
	{ 
		params ["_modulePosition"]; 
		
		[] call grad_SR_fnc_Prequel_initPlayerExfil;
	}
] call zen_custom_modules_fnc_register;



// STOP

[
	"Silent Rain Stop",
	"Stop Convoy Formation",
	{ 
		params ["_modulePosition"]; 
		
		if (missionNamespace getVariable ["GRAD_CancelConvoy", false]) exitWith {
			hint "Convoy has already been stopped!";
		};

		missionNameSpace setVariable ["GRAD_CancelConvoy", true, true];
	}
] call zen_custom_modules_fnc_register;



