

private _approachPath = [];
private _startMarkerNumber = 1;
private _finishMarkerNumber = 21;
for "_i" from _startMarkerNumber to _finishMarkerNumber do
{
	private _marker = call(compile format ["GRAD_Approach_%1", _i]);
	private _speed = _marker getVariable ["GRAD_driveSpeed", 18];
	private _point = getPos _marker;
	_point pushBack _speed;
	_approachPath pushBack (getPos _marker);
};

private _pos123Path = [];
_finishMarkerNumber = 35;
for "_i" from _startMarkerNumber to _finishMarkerNumber do
{
	private _marker = call(compile format ["GRAD_Pos123_%1", _i]);
	private _speed = _marker getVariable ["GRAD_driveSpeed", 18];
	private _point = getPos _marker;
	_point pushBack _speed;
	_pos123Path pushBack (getPos _marker);
};

private _path = _approachPath + _pos123Path;
systemChat str (count _path);
veh_1 setDriveOnPath _path;