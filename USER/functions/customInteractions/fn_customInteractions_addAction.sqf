params ["_unit", "_name"];

// name is used for sound file identification of voice

_unit addEventHandler ["GestureDone", {
	params ["_unit", "_gesture"];

	_unit setVariable ["grad_SR_gestureRunning", false];
}];


// CHANGE EMOTION
_unit addAction
[
	"Change Emotions",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
		
	},
	nil,		// arguments
	6,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"!(_this getVariable ['grad_SR_gestureRunning', false])", 	// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


if (_name == "nadia") then {

	_unit setVariable ["grad_SR_name", "nadia"];

	_unit addAction
	[
		"Pee After",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "peeafter"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'peeAfter', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"<t color='#FFD966'>Pee Now (Animation)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] remoteExecCall ["grad_SR_fnc_hooker_animSquatStart", 0];
			
		},
		nil,		// arguments
		2,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"true", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"Pee Before",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "peebefore"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'peeBefore', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"Confused",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "confused"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'confused', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"Greet",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "greet"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'greet', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"dontknow",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "dontknow"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'dontknow', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"no",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "no"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'no', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"quasimdead",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "quasimdead"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'quasimdead', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"quasimlove",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "quasimlove"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'quasimlove', (_originalTarget getVariable ['grad_SR_emotion', 'seduce'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"whatshappening",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "whatshappening"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'whatshappening', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"yes",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "yes"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"(['nadia', 'yes', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
};