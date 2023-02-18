params ["_kebapbox", "_unit"];

_kebapbox attachTo [_unit, [0,0,-.1], "lefthand", true];

if (!isNull (_unit getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull])) then {
	[_unit, "GestureAgonyCargo"] call ace_common_fnc_doGesture;
};

_unit setvariable ["grad_SR_kebapbox", _kebapbox, true];
