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
};