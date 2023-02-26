params ["_killerKebapDriver"];

_killerKebapDriver addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	if (local _unit) then {
		private _kebapbox = [_unit] call grad_SR_fnc_killerKebap_spawnKebap;
		[_kebapbox, _unit] call grad_SR_fnc_killerKebap_carryKebap;
		_vehicle setVariable ["songPlaying", false, true];
	};
}];

_killerKebapDriver addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	if (local _unit) then {
		private _kebapbox = _unit getVariable ["grad_SR_kebapbox", objNull];
		[_unit, _kebapbox] call grad_SR_fnc_killerKebap_deleteKebap;

		[_vehicle] remoteExec ["grad_SR_fnc_killerkebap_playSong", [0, -2] select isDedicated, _vehicle];
		
	};
}];



_killerKebapDriver addAction
[
	"Pick up Kebap",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[cursorObject, _caller] call grad_SR_fnc_killerKebap_carryKebap;
	},
	nil,		// arguments
	2,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"typeOf cursorObject == 'EauDeCombat_01_box_F' && player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && isNull (_this getvariable ['grad_SR_kebapbox', objNull])", 	// condition
	2,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_killerKebapDriver addAction
[
	"Drop Kebap",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_caller] call grad_SR_fnc_killerKebap_dropKebap;
	},
	nil,		// arguments
	2,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !isNull (_this getvariable ['grad_SR_kebapbox', objNull])", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];



_killerKebapDriver addAction
[
	"Carry Gesture",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_caller, "GestureAgonyCargo"] call ace_common_fnc_doGesture;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !isNull (_this getvariable ['grad_SR_kebapbox', objNull]) && gestureState _this != 'GestureAgonyCargo'", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
[
	"Stop Carry Gesture",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_caller, "GestureEmpty"] call ace_common_fnc_doGesture;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !isNull (_this getvariable ['grad_SR_kebapbox', objNull]) && gestureState _this == 'GestureAgonyCargo'", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver setVariable ["grad_SR_name", "khalil"];
_killerKebapDriver setVariable ["grad_SR_emotion", "angry"];

// CHANGE EMOTION
_killerKebapDriver addAction
[
	"<t color='#3366FF'>Change Emotion (ANGRY)</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
		
	},
	nil,		// arguments
	6,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_this getVariable ['grad_SR_gestureRunning', false]) && (_this getVariable ['GRAD_SR_emotion', 'angry']) == 'angry'", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_killerKebapDriver addAction
[
	"<t color='#33FF66'>Change Emotion (PLEADING)</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
		
	},
	nil,		// arguments
	6,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_this getVariable ['grad_SR_gestureRunning', false]) && (_this getVariable ['GRAD_SR_emotion', 'pleading']) == 'pleading'", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];




_killerKebapDriver addAction
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
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'greet', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
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
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'dontknow', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
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
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'no', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_killerKebapDriver addAction
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
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'yes', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
[
	"curse",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller, "curse"] call grad_SR_fnc_customInteractions_play;
		
	},
	nil,		// arguments
	1,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'curse', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_killerKebapDriver addAction
[
	"detected",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller, "detected"] call grad_SR_fnc_customInteractions_play;
		
	},
	nil,		// arguments
	1,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'detected', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
[
	"letmego",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller, "letmego"] call grad_SR_fnc_customInteractions_play;
		
	},
	nil,		// arguments
	1,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'letmego', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_killerKebapDriver addAction
[
	"pleasedonthurt",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller, "pleasedonthurt"] call grad_SR_fnc_customInteractions_play;
		
	},
	nil,		// arguments
	1,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'pleasedonthurt', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_killerKebapDriver addAction
[
	"russian",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		
		[_caller, "russian"] call grad_SR_fnc_customInteractions_play;
		
	},
	nil,		// arguments
	1,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['khalil', 'russian', (_originalTarget getVariable ['grad_SR_emotion', 'pleading'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
	0,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];