params ["_position", "_male"];

private _classname = "UK3CB_TKC_C_CIV";

if (_male) then {
	_classname = selectRandom [
		"UK3CB_TKC_C_CIV"
	];
} else {
	_classname = selectRandom [
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
	
};

private _unit = (createGroup civilian) createUnit [
		_classname, 
		_position, 
		[], 
		0, 
		"NONE"
	];

if (_male) then {
	_unit addHeadgear (selectRandom ["UK3CB_ADE_I_H_Turban_01_1", "UK3CB_ADE_O_H_Turban_01_2"]);
};