params ["_hooker"];

_dir = getDir _hooker;

private _puddle = createSimpleObject ["WaterSpill_01_Small_New_F", AGLToASL (getPos _hooker), true];
_puddle setPos getPos _hooker;
_puddle setObjectScale 0.02;
_puddle say3D ["hooker_pee", 30];

_stream = "#particlesource" createVehicleLocal [0,0,0];
_stream setParticleRandom [0,[0.004,0.004,0.004],[0.01,0.01,0.01],30,0.01,[0,0,0,0],1,0.02,360];

_stream setDropInterval 0.001;

_stream attachTo [_hooker,[0,-0.10,-0.10],"Pelvis"];


private _puddleSizeChange = [_puddle] spawn {
	params ["_puddle"];

	for "_i" from 0 to 1 step 0.01 do {
		_puddle setObjectScale _i;
		sleep 0.14;
	}; 
};

// instantly abort if necessary
[{
	params ["_hooker", "_puddleSizeChange", "_thisScript"];
	!(_hooker getVariable ['grad_SR_animationRunning', false])
},{
	params ["_hooker", "_puddleSizeChange", "_thisScript"];
	if (!isNull _thisScript) then {
		terminate _thisScript;
		terminate _puddleSizeChange;
	};
},[_hooker, _puddleSizeChange, _thisScript]] call CBA_fnc_waitUntilAndExecute;

for "_i" from 0 to .5 step 0.01 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};
sleep 4;

for "_i" from .5 to 0.4 step -0.01 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

for "_i" from 0.4 to 0.8 step 0.02 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

for "_i" from 0.8 to 0.2 step -0.01 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

for "_i" from 0.2 to 0.3 step 0.02 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

for "_i" from 0.3 to 0.1 step -0.01 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

for "_i" from 0.1 to 0 step -0.01 do {
	_stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,_i],[0.8,0.7,0.2,_i],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.02;
};

deleteVehicle _stream;
