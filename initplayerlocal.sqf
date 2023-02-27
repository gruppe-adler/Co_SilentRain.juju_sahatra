if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

// SITTING
if ((side player isEqualTo west) && ((typeOf player) isNotEqualTo "B_officer_F")) then {
	private _chair = nearestObject [player, "Land_CampingChair_V2_F"];
	[_chair, player] call ace_sitting_fnc_sit;
};

if (!isMultiplayer) exitWith {};
// LAYER DELETION
{
	_x params ["_objects", "_markers"];

	{
		if (isNull _x) then { continue };
		
		_x enableSimulation false;
        _x hideObject true;
	} forEach _objects;

	{
        deleteMarkerLocal _x;
	} forEach _markers;
} forEach GRAD_LAYERS_TO_DELETE;