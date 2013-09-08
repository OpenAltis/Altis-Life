/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_sessionCreate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Start the process and setup the players information on the server.
*/
private["_packet"];
cutText["Creating player information on server...","BLACK FADED"];
0 cutFadeOut 9999999;
_packet = [player,playerSide,life_cash,life_atmcash];
switch (playerSide) do
{
	case west:
	{
		[] call life_fnc_copDefault;
		_gear = cop_gear;
		_packet set[count _packet,_gear];
	};
	
	case civilian:
	{
		_packet set[count _packet,life_is_arrested];
	};
};

[_packet,"STS_fnc_add",false,false] spawn BIS_fnc_MP;