params ["_unit", "_type"];

private _name = _unit getVariable ["grad_SR_name", "none"];
private _emotion = _unit getVariable ["grad_SR_emotion", "fear"];

private _soundCount = [_name, _type, _emotion] call grad_SR_fnc_customInteractions_getSoundCount;
private _gestures = [_type] call grad_SR_fnc_customInteractions_getGestureAndSound;

systemChat ("sound count : " + str _soundCount);

private _randomSound = str (ceil (random _soundcount));


// systemChat (_name + "_" + _type + "_" + _randomSound + "_" + _emotion);
private _soundName = _name + "_" + _type + "_" + _randomSound + "_" + _emotion;



if (count _gestures > 0) then {
	_unit setVariable ["grad_SR_gestureRunning", true];
	
	private _gesture = selectrandom _gestures;
	[_unit, _gesture, 1] call ace_common_fnc_doGesture;
};

[_unit, _soundName] remoteExec ["say3d"];
// systemChat "playing";