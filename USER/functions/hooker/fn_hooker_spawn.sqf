params ["_position"];

private _hooker = (createGroup civilian) createUnit ["Max_Tak_woman6", _position, [], 0, "NONE"];
[_killerKebapDriver, "nadia"] remoteExec ["setIdentity", 0, _killerKebapDriver];
[_killerKebapDriver] call ace_common_fnc_setName;

[_hooker, "nadia"] remoteExec ["grad_SR_fnc_customInteractions_addAction", [0,-2] select isDedicated, _hooker];
