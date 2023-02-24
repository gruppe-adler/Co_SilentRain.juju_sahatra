params ["_unit"];

// [_unit, "PersianHead_A3_02_sick"] remoteExec ["setFace", [0,-2] select isDedicated, _unit];

[_unit, "qasim_bg1"] remoteExec ["setIdentity", 0, _unit];
[_unit] call ace_common_fnc_setName;