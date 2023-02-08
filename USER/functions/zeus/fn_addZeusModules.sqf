
[
	"Silent Rain",
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
	"Silent Rain",
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
	"Silent Rain",
	"Start EVAC Call (Combat)",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["evac_call_combat"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["evac_call_combat"] spawn grad_SR_fnc_Prequel_playCall;
		};
	}
] call zen_custom_modules_fnc_register;

[
	"Silent Rain",
	"Start EVAC Call (Normal)",
	{ 
		params ["_modulePosition"]; 
		
		if (isMultiplayer) then {
			["evac_call_normal"] remoteExec ["grad_SR_fnc_Prequel_playCall", -2];
		} else {
			["evac_call_normal"] spawn grad_SR_fnc_Prequel_playCall;
		};
	}
] call zen_custom_modules_fnc_register;