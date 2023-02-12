params ["_unit", "_sound"];

private _soundObject = _unit say3D _sound;

_unit setRandomLip true;
[{
	params ["_unit", "_soundObject"];
	isNull _soundObject
},{
	params ["_unit", "_soundObject"];
	_unit setRandomLip false;

}, [_unit, _soundObject]] call CBA_fnc_waitUntilAndExecute;
