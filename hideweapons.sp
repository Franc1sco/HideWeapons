/*  SM Hide Weapons
 *
 *  Copyright (C) 2017 Francisco 'Franc1sco' García based on psychonic snippet
 * 
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) 
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT 
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with 
 * this program. If not, see http://www.gnu.org/licenses/.
 */

#include <sourcemod>
#include <sdkhooks>

#pragma newdecls required

#define VERSION "1.0"

public Plugin myinfo = {
	name = "SM Hide Weapons",
	author = "Franc1sco franug",
	description = "Simple plugin for hide weapons in the back.",
	version = VERSION,
	url = "http://steamcommunity.com/id/franug"
};

public void OnPluginStart()
{
	CreateConVar("sm_hideweapons_version", VERSION, "Plugin version", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);
	for (int i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i))
			OnClientPutInServer(i);
	}
}

public void OnClientPutInServer(int iClient)
{
	SDKHook(iClient, SDKHook_PostThinkPost, OnPostThinkPost);
}

public void OnPostThinkPost(int iClient)
{
	SetEntProp(iClient, Prop_Send, "m_iAddonBits", 0);
}