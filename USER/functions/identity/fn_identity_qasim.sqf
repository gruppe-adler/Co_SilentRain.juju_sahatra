params ["_unit"];

// [_unit, "PersianHead_A3_01_sick"] remoteExec ["setFace", [0,-2] select isDedicated, _unit];

[_unit, "qasim"] remoteExec ["setIdentity", [0,-2] select isDedicated, _unit];