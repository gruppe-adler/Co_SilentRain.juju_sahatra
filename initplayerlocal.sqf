if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (!isMultiplayer) exitWith {};
{
	_x params ["_objects", "_markers"];

	{
		_x enableSimulation false;
        _x hideObject true;
	} forEach _objects;

	{
        deleteMarkerLocal _x;
	} forEach _markers;
} forEach GRAD_LAYERS_TO_DELETE;