params ["_unit"];

private _kebapbox = _unit getvariable ["grad_SR_kebapbox", objNull];

if (isNull _kebapbox) exitWith {
	[_unit, "GestureEmpty"] call ace_common_fnc_doGesture;
};

[_unit, "GestureEmpty"] call ace_common_fnc_doGesture;

detach _kebapbox;

_unit setvariable ["grad_SR_kebapbox", objNull, true];

// ["BIS_fnc_moduleRemoteControl_owner", objNull];