#include <sourcemod>
#include <sdkhooks>

#pragma newdecls required

#define VERSION "1.0"

public Plugin myinfo = {
	name = "SM Hide Weapons",
	author = "Franc1sco franug",
	description = "",
	version = VERSION,
	url = "http://steamcommunity.com/id/franug"
};

public void OnPluginStart()
{
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