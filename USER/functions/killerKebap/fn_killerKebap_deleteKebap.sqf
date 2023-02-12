params ["_unit", "_kebapbox"];

if (isNull _kebapbox) exitWith {
	[_unit, "GestureEmpty"] call ace_common_fnc_doGesture;
};

[_unit, "GestureEmpty"] call ace_common_fnc_doGesture;

deleteVehicle _kebapbox;

_unit setvariable ["grad_SR_kebapbox", objNull, true];