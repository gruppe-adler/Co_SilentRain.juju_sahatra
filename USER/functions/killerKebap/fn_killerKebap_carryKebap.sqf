params ["_unit"];

private _kebapbox = "EauDeCombat_01_box_F" createVehicle [0,0,0];
_kebapbox attachTo [_unit, [0,0,-.1], "lefthand", true];
_kebapbox setObjectTextureGlobal [0, "data\kebapbox.paa"];

[_unit, "GestureAgonyCargo"] call ace_common_fnc_doGesture;

_unit setvariable ["grad_SR_kebapbox", _kebapbox, true];

_kebapbox addAction
[
	"Pick up Kebap",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_caller] call grad_SR_fnc_killerKebap_carryKebap;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"isNull (_this getvariable ['grad_SR_kebapbox', objNull])", 	// condition
	2,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];