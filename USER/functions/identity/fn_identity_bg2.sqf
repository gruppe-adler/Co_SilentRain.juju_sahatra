params ["_unit"];

// [_unit, "PersianHead_A3_03_sick"] remoteExec ["setFace", [0,-2] select isDedicated, _unit];

[_unit, "qasim_bg2"] remoteExec ["setIdentity", 0, _unit];
[_unit] call ace_common_fnc_setName;