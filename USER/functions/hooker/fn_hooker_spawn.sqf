params ["_position"];

private _hooker = (createGroup civilian) createUnit ["Max_Tak_woman6", _position, [], 0, "NONE"];
[_hooker, "max_female8"] remoteExec ["setFace", [0,-2] select isDedicated, _hooker];


[_hooker, "nadia"] remoteExec ["grad_SR_fnc_customInteractions_addAction", [0,-2] select isDedicated, _hooker];
