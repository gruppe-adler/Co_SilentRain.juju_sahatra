params ["_unit", "_sound", ["_variableToAbort", "none"]];

private _soundObject = _unit say3D _sound;

_unit setRandomLip true;
[{
	params ["_unit", "_soundObject", "_variableToAbort"];
	isNull _soundObject || !(_unit getVariable [_variableToAbort, true])
},{
	params ["_unit", "_soundObject"];
	_unit setRandomLip false;

}, [_unit, _soundObject, _variableToAbort]] call CBA_fnc_waitUntilAndExecute;
