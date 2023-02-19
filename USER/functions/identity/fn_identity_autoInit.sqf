if (!isServer) exitWith {};

["O_officer_F", "init", {
	params ["_unit"];

	[_unit] remoteExec ["grad_SR_fnc_identity_qasim", [0,-2] select isDedicated, _unit];
}, true, [], true] call CBA_fnc_addClasseventhandler;


["O_soldier_UAV_F", "init", {
	params ["_unit"];

	[_unit] remoteExec ["grad_SR_fnc_identity_bg1", [0,-2] select isDedicated, _unit];
}, true, [], true] call CBA_fnc_addClasseventhandler;

["O_soldier_UAV_06_F", "init", {
	params ["_unit"];

	[_unit] remoteExec ["grad_SR_fnc_identity_bg2", [0,-2] select isDedicated, _unit];
}, true, [], true] call CBA_fnc_addClasseventhandler;
