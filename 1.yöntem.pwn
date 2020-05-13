// SA-MP Amper NO-SQL Register & Login

#include <a_samp>
#include <a_json>
#include <easydialog>

#define TYPE_SEARCHACCOUNT (0)
#define TYPE_CONTROLPASSWORD (1)

main() {}

public OnPlayerRequestClass(playerid, classid)
{
	CheckAccount(TYPE_SEARCHACCOUNT, playerid, "");
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 0;
}

forward CheckAccount(type, playerid, password[]);
public CheckAccount(type, playerid, password[])
{
	new PlayerName[MAX_PLAYER_NAME], fileName[MAX_PLAYER_NAME+5];

	GetPlayerName(playerid, PlayerName, MAX_PLAYER_NAME);
	format(fileName, sizeof(fileName), "accounts/%s.json", PlayerName);

	new JSONNode:response;

	response = json_parse_file(fileName);

	if(type == TYPE_SEARCHACCOUNT)
	{
		new json_playername[MAX_PLAYER_NAME];
		json_get_string(response, json_playername, sizeof(json_playername), "account_name");

		Dialog_Show(playerid, PLAYER_LOGIN, DIALOG_STYLE_PASSWORD, json_playername, "Hesabýnýz ile ilgili verilere eriþildi þifrenizi girerek kendinizi doðrulayýn.", "Giriþ Yap", "Çýkýþ");
	}
	else if(type == TYPE_CONTROLPASSWORD)
	{
		new json_password[128];
		json_get_string(response, json_password, sizeof(json_password), "account_password");
		SendClientMessage(playerid, -1, "Veriler baþarýyla çekildi.");

		printf("Admin: %s, Money: %d", json_get_bool(response, "account_admin"), json_get_int(response, "account_money"));
	}
}

Dialog:PLAYER_LOGIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		CheckAccount(TYPE_CONTROLPASSWORD, playerid, inputtext);
	}
	return 1;
}