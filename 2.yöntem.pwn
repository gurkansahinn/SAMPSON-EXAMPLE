// SA-MP Amper NO-SQL Register & Login

#include <a_samp>
#include <a_http>
#include <sscanf2>
#include <a_json>

#define RESPONSE_OK (200)
#define RESPONSE_PAGENOTFOUND (404)
#define RESPONSE_SERVERERROR (500)
#define RESPONSE_FORBIDDEN (403)

main {}

public OnPlayerRequestClass(playerid, classid)
{
	CheckAccount(playerid);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 0;
}

public CheckAccount(playerid)
{
	new 
		url[46+MAX_PLAYER_NAME], PlayerName[MAX_PLAYER_NAME];

	GetPlayerName(playerid, PlayerName, MAX_PLAYER_NAME);
	format(url, sizeof(url), "https://www.lilamper.tech/samp-example/%s.json", PlayerName);
	HTTP(playerid, HTTP_GET, url, "", "CheckAccountJson");
	return 1;
}

forward CheckAccountJson(index, response_code, data[]);
public CheckAccountJson(index, response_code, data[]) // index = playerid olarak i�lem g�r�r.
{
    /*
     Response kodlar�na g�re i�lem yapt�rabilirsiniz �rne�in: 404 sayfa bulunamad�, 
     500 Server Hatas�, 403 Eri�im yetkisi yok, 200 ba�lant� ba�ar�l�. Bunlar� oyun moduna tan�mlarsan�z
     di�er geli�tiriciler daha iyi anlayabilir. �rnek oyun modunda bunu zaten ben sizin i�in yapt�m.
    */

    if(response_code == RESPONSE_OK)
    {
    	new player_name[MAX_PLAYER_NAME], JSONNode:decode;

    	decode = json_parse_string(data);

    	json_get_string(decode, player_name, sizeof(player_name), "account_name");
    	printf("JSON: %s", data);
    	printf("DECODE: %s", player_name);
    }
    else if(response_code == RESPONSE_PAGENOTFOUND)
    {
    	SendClientMessage(index, -1, "Sunucu i�erisinde hesab�n�z bulunmuyor. Oyundan ��kart�l�yorsunuz.");
    	Kick(index);
    }
    else
    {
    	printf("HTTP iste�i hata ile kar��la�t�. RESPONSE CODE: %d", response_code);
    	SendClientMessage(index, -1, "Sunucu tarafl� bir sorun ile kar��la��ld�. Daha sonra tekrar deneyebilirsiniz.");
    	Kick(index);
    }
    return 1;
}