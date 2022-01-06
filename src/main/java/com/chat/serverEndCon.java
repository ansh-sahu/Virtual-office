package com.chat;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.*;

public class serverEndCon extends ServerEndpointConfig.Configurator{
	public void modifyHandshake (ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) { 
		 sec.getUserProperties().put("receiver", (String) ((HttpSession) request.getHttpSession()).getAttribute("receiver"));
		 sec.getUserProperties().put("sender", (String) ((HttpSession) request.getHttpSession()).getAttribute("username"));
		 sec.getUserProperties().put("ids", (String) ((HttpSession) request.getHttpSession()).getAttribute("userid"));
	}
}