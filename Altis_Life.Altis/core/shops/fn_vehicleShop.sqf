/*
	File: fn_vehicleShop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the vehicle shop.
	CAN"T WAIT TO SCRAP THIS!
*/
private["_display","_vehicles","_veh","_price","_pic","_name","_kill"];
disableSerialization;
_kill = "";
if(!dialog) then
{
	createDialog "Life_vehicle_shop";
	life_veh_shop = _this select 3;
};

_display = findDisplay 2300;
_vehicles = _display displayCtrl 2302;
lbClear _vehicles;
ctrlShow[2303,false];

switch (life_veh_shop) do
{
	case "civ_car":
	{
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car2":
	{
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car3":
	{
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_servt":
	{
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "reb_car":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};
	
	case "reb_car2":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Spartan Car Shop"];
	};
	
	case "reb_air":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Air Shop"];
	};
	
	case "reb_ship1":
		{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Boat Shop"];
	};
	
	case "cop_car":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car2":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "fed_car":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		if(life_adminlevel < 1) exitWith {_kill = "You Are Not A Federal Agent!"};
		ctrlSetText[2301,"Secret Service Car Shop"];
		
	};
	
	case "civ_air":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "civ_air2":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "cop_air":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "cop_air2":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "fed_air":
	{
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		if(life_adminlevel < 1) exitWith {_kill = "You Are Not A Federal Agent!"};
		ctrlSetText[2301,"Secret Service Air Shop"];
	};
	
	case "civ_ship":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Agia Marina Boat Shop"];
	};
	
	case "civ_ship2":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Kamino Boat Shop"];
	};
	
	case "civ_truck_shop":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "civ_ship3":
	{
		if(playerSide == west) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Girna Boat Shop"];
	};
	
	case "cop_ship":
	{	
		if(playerSide == civilian) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Boat Shop"];
	};
	
	case "donator_heli":
	{
		if(life_donator < 1) exitWith {_kill = "You Have Not Donated!"};
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Donator Air Shop"];
	};
	
	case "donator_car":
	{
		if(life_donator < 1) exitWith {_kill = "You Have Not Donated!"};
		if(playerSide == west) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Donator Car Shop"];
	};

};

if(_kill != "") exitWith {
hint _kill;
closeDialog 0;
};

{
	_veh = _x select 0;
	_price = _x select 1;
	
	if(_veh == "C_Offroad_01_F" && _price == 15000) then
	{
		_name = "Service Truck";
	}
		else
	{
		_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
	};
	_pic = getText(configFile >> "CfgVehicles" >> _veh >> "picture");
	_vehicles lbAdd format["%1 - $%2",_name, [_price] call life_fnc_numberText];
	
	if(_name == "Service Truck") then
	{
		_vehicles lbSetData [(lbSize _vehicles)-1,"serv_truck"];
	}
		else
	{
		_vehicles lbSetData [(lbSize _vehicles)-1,_veh];
	};
	_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
	_vehicles lbSetValue [(lbSize _vehicles)-1,_price];
} foreach ([life_veh_shop] call life_fnc_vehicleListCfg);