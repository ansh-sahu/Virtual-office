package com.chat;

//package com.chat.Servlet;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

//import javax.json.*;


import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;




@ServerEndpoint(value="/serverend/{chatroom}",configurator=serverEndCon.class)
public class serverend {
	static Map<String,Set<Session>> onlineusers=(Map<String,Set<Session>>)Collections.synchronizedMap(new HashMap<String, Set<Session>>());
	public Set<Session> getonlineuser(String idsr,String idrs){
		Set<Session> id1=onlineusers.get(idsr);
		Set<Session> id2=onlineusers.get(idrs);
		if (id1==null && id2!=null) {
			return id2;
		}
		else if(id1!=null && id2==null) {
			return id1;
		}
		else {
			id1=Collections.synchronizedSet(new HashSet<Session>());
			onlineusers.put(idsr, id1);
			return id1;
			}

	}
	
	@OnOpen
	public void handleOpen(EndpointConfig config,Session userSession,@PathParam("chatroom") String chatroom)
	{
		userSession.getUserProperties().put("ids",config.getUserProperties().get("ids"));
		String idsr=(String) userSession.getUserProperties().get("ids")+"-"+chatroom;
		String idrs=chatroom+"-"+(String) userSession.getUserProperties().get("ids");
		System.out.println(idsr+" "+idrs);
		//userSession.getUserProperties().put("sender",config.getUserProperties().get("sender"));
		//String sender=(String) userSession.getUserProperties().get("sender");
		//System.out.println("sender:"+sender);
		userSession.getUserProperties ().put("chatroom", chatroom);
		Set<Session> chatroomUsers=getonlineuser(idsr,idrs);
		chatroomUsers.add(userSession);
		userSession.getUserProperties().put("receiver",config.getUserProperties().get("receiver"));
	}
	@OnMessage
	public void handleMessage(String message, Session userSession) {

		String username= (String) userSession.getUserProperties().get("sender");
		int decider=0;
		String chatroom=(String)userSession.getUserProperties ().get("chatroom"); 
		String idsr=(String) userSession.getUserProperties().get("ids")+"-"+chatroom;
		String idrs=chatroom+"-"+(String) userSession.getUserProperties().get("ids");
		Set<Session> chatroomUsers=getonlineuser(idsr,idrs);
		if(chatroomUsers.size()>1) {
			decider=1;
		}
//		for(Session s: chatroomUsers) {
//			if((String)s==(String)userSession.getUserProperties ().get("chatroom")) {
//				decider=1;
//				System.out.println(decider);
//			}
//			System.out.println(decider);
//		}
		System.out.println(decider);
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
			 PreparedStatement statement = con.prepareStatement("INSERT INTO chat(senderid,receiverid,message,decider) values(?,?,?,?)");
			 statement.setString(1, (String) userSession.getUserProperties().get("ids"));
			 statement.setString(2, chatroom);
			 statement.setString(3, message);
			 statement.setInt(4, decider);
			 statement.executeUpdate();
			 con.close();
		 }
		 catch (Exception e) 
			{

			e.printStackTrace();
			}
	
		chatroomUsers.stream().forEach(x -> {
		try {
			System.out.println(x);
		x.getBasicRemote().sendText(buildJsonData(username, message));

		} catch (Exception e) {

		e.printStackTrace();
		}
		});
	}
	@OnClose
	public void handleClose(Session userSession) {
		String chatroom=(String)userSession.getUserProperties().get("chatroom");
		String idsr=(String) userSession.getUserProperties().get("ids")+"-"+chatroom;
		String idrs=chatroom+"-"+(String) userSession.getUserProperties().get("ids");
		Set<Session> chatroomUsers=getonlineuser(idsr,idrs); 
		chatroomUsers.remove(userSession);
	}
	@OnError
	public void handleError(Throwable t) {}
		private String buildJsonData (String username,String message) {
			//JsonObject jsonObject = Json.createObjectBuilder().build();
//			JsonBuilderFactory factory = Json.createBuilderFactory(config);
//			 JsonObject value = factory.createObjectBuilder();
//			
			JsonObject jsonObject=Json.createObjectBuilder().add("message", username+": "+message).build();

			StringWriter stringWriter = new StringWriter();

			try (JsonWriter jsonWriter= Json.createWriter(stringWriter)) {
				jsonWriter.write(jsonObject);
				}
	
			return stringWriter.toString();
	}

}
