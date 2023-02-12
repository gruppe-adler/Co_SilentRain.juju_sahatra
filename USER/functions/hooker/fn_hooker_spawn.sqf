params ["_position"];

private _hooker = (createGroup civilian) createUnit ["Max_woman2", _position, [], 0, "NONE"];

[{
	params ["_hooker"];
	_hooker setObjectTextureGlobal [0, "data\hooker_custom.paa"];
}, [_hooker], 3] call CBA_fnc_waitAndExecute; 

[_hooker, "nadia"] remoteExec ["grad_SR_fnc_customInteractions_addAction", [0,-2] select isDedicated, _hooker];
