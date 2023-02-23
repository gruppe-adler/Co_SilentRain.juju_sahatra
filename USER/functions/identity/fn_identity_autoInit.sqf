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

["UK3CB_TKC_C_CIV", "init", {
	params ["_unit"];

	[_unit] remoteExec ["grad_SR_fnc_identity_addActionsMale"];
}, true, [], true] call CBA_fnc_addClasseventhandler;

{
	[_x, "init", {
		params ["_unit"];

		[_unit] remoteExec ["grad_SR_fnc_identity_addActionsFeMale"];
	}, true, [], true] call CBA_fnc_addClasseventhandler;
} forEach [
	"Max_Taky_woman1",
	"Max_Taky_woman2",
	"Max_Taky_woman3",
	"Max_Taky_woman4",
	"Max_Taky_woman5",
	"Max_Tak2_woman1",
	"Max_Tak2_woman2",
	"Max_Tak2_woman3",
	"Max_Tak2_woman4",
	"Max_Tak2_woman5"
];