/**
 * Called when some event need to be sended to the Jaguares CSGO Api
 */

 public void createRequest(int client, int identifier, char[] apiAction) {

    
    char[] url = new char[64];
    char[] apiToken = new char[80];
    char[] userSteamID = new char[32];
    char[] serverPort = new char[6];
	
    g_ApiEndPointPugCvar.GetString(url, 64);
    g_ApiTokenPugCvar.GetString(apiToken, 80);
    g_serverPortPugCvar.GetString(serverPort, 6);

    GetClientAuthId(client, AuthId_SteamID64, userSteamID, 32);
    if(url[1] && apiToken[1] && userSteamID[1] && serverPort[1]){

		sendRequest(url, apiToken, userSteamID, serverPort, identifier, apiAction);
	}
 }

 public void sendRequest(char[] endPoint, char[] apiToken, char[] steamid64, char[] serverPort, int identifier, char[] apiAction){

    System2HTTPRequest httpRequest = new System2HTTPRequest(HttpResponseCallback, endPoint);
    httpRequest.Timeout = 60;
    httpRequest.SetHeader("Authorization", "Bearer %s", apiToken);
    httpRequest.SetHeader("Content-Type", "application/x-www-form-urlencoded");
    httpRequest.SetUserAgent("Mozilla");
    httpRequest.SetHeader("Accept", "application/json");
    httpRequest.SetData("action=%s&steamid64=%s&port=%s&identifier=%i", apiAction, steamid64, serverPort, identifier); 
    httpRequest.POST(); 
}

void HttpResponseCallback(bool success, const char[] error, System2HTTPRequest request, System2HTTPResponse response, HTTPRequestMethod method) {
    if(success) {
    	PrintToServer("Sucesso, significa que o envio do POST request foi realizado!");
    } else {
    	PrintToServer("DEU RUIM =(");
    }
    
    if(error[0]){}
    if(request){}
    if(response){}
    if(method){}
}