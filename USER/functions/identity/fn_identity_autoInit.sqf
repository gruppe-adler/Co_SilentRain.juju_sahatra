if (!isServer) exitWith {};

["O_officer_F", "init", {
	params ["_unit"];

	[_unit] call grad_SR_fnc_identity_qasim;
}, true, [], true] call CBA_fnc_addClasseventhandler;


["O_soldier_UAV_F", "init", {
	params ["_unit"];

	[_unit] call grad_SR_fnc_identity_bg1;
}, true, [], true] call CBA_fnc_addClasseventhandler;

["O_soldier_UAV_06_F", "init", {
	params ["_unit"];

	[_unit] call grad_SR_fnc_identity_bg2;
}, true, [], true] call CBA_fnc_addClasseventhandler;
