/*
* Returns the Paratrooper Line-Up of a certain plane
*
* Arguments:
* 0: The plane <OBJECT>
* 1: Players Only <BOOL> (default: true)
*
* Return Value:
* Ordered Line-Up in the directin of flight, left to right, front to back <2D ARRAY>
*
* Example:
* [plane1, false] call grad_SR_fnc_Drop_getParatrooperLineUp;
*/

params ["_plane", ["_onlyPlayers", true]];

// Using the plane boundaries to calculate the area where the paratroopers may be positioned 
(boundingBoxReal _plane) params ["_p1", "_p2"];
private _planeWidth = abs ((_p2 select 0) - (_p1 select 0)); 
private _planeLength = abs ((_p2 select 1) - (_p1 select 1)); 
private _planeHeight = abs ((_p2 select 2) - (_p1 select 2));

private _planePos = getPos _plane;
_planePos set [2, (_planePos select 2) + _planeHeight / 2];

// the paratroopers
private _paratroopers = [];
if (_onlyPlayers) then {
	_paratroopers = allPlayers inAreaArray [_planePos, _planeWidth / 2, _planeLength / 2, getDir _plane, true, _planeHeight / 2];
} else {
	_paratroopers = allUnits inAreaArray [_planePos, _planeWidth / 2, _planeLength / 2, getDir _plane, true, _planeHeight / 2];
};

private _troopersLeft = [];
private _troopersRight = [];
{
	(_plane worldToModel (getPos _x)) params ["_offsetX"];
	if (_offsetX >= 0) then {
		_troopersRight pushBackUnique _x;
	} else {
		_troopersLeft pushBackUnique _x;
	};
} forEach _paratroopers;

private _measurePos = _plane modelToWorld [0, 100, 0];

_troopersRight = [_troopersRight, [_measurePos], { _x distance _input0 }, "ASCEND"] call BIS_fnc_sortBy;
_troopersRight = [_troopersRight, [_measurePos], { _x distance _input0 }, "ASCEND"] call BIS_fnc_sortBy;

[_troopersLeft, _troopersRight]