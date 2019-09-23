package com.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/websocket.do", configurator = WebSocketConfigurator.class)
public class WebSocketNoHTTP {
	static Set<Session> users = Collections.synchronizedSet(new HashSet<Session>());
	private String user = "";
	static private List<Object> recordmsg = new ArrayList<Object>();

	@OnOpen
	public void handleOpen(EndpointConfig endpointConfig, Session userSession) {
		System.out.println("WebSocket成功啟動");
		String msgPackage = "";
		String mykey = "";
		userSession.getUserProperties().put("username", endpointConfig.getUserProperties().get("username"));
		users.add(userSession);
		try {
			if (endpointConfig.getUserProperties().get("username").toString().indexOf("系統管理員") >= 0) {
				msgPackage = buildJsonData("系統訊息", "系統管理員連線成功!");
				userSession.getBasicRemote().sendText(msgPackage);
			} else if (endpointConfig.getUserProperties().get("username").toString().indexOf("1") >= 0) {
				msgPackage = buildJsonData("系統訊息", "客服人員連線成功!");
				userSession.getBasicRemote().sendText(msgPackage);
				if (recordmsg != null) {
					Iterator<Object> itmsg = recordmsg.iterator();
					while (itmsg.hasNext()) {
						Map<String, String> recordMap = (Map<String, String>) itmsg.next();
						Iterator<String> keys = recordMap.keySet().iterator();
						while (keys.hasNext()) {
							mykey = keys.next();
							msgPackage = buildJsonData(mykey, recordMap.get(mykey));
							userSession.getBasicRemote().sendText(msgPackage);
						}
					}
				}
			} else {
				msgPackage = buildJsonData("系統訊息", "連線成功!");
				userSession.getBasicRemote().sendText(msgPackage);

				msgPackage = buildJsonData("後台管理員", "稍等片刻馬上有專人為您服務!");
				userSession.getBasicRemote().sendText(msgPackage);
			}
		} catch (IOException e) {
			System.out.println("IOException好吵");
		}
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) {

		String keyWord = userSession.getUserProperties().get("username").toString().substring(0, 1);
		user = userSession.getUserProperties().get("username").toString().substring(1);

		if (message == null || message.trim().length() == 0)
			return;

		Iterator<Session> iterator = users.iterator();
		try {
			while (iterator.hasNext()) {

				Map<String, String> recordMap = new HashMap<String, String>();
				if ("M".equals(keyWord)) {
					recordMap.put(user, message);
				}
				recordmsg.add(recordMap);

				String msgPackage = buildJsonData(user, message);
				// userSession.getBasicRemote().sendText(msgPackage);
				iterator.next().getBasicRemote().sendText(msgPackage);
			}
		} catch (IOException e) {
			System.out.println("IOException好吵");
		}
	}

	@OnClose
	public void handleClose(Session userSession) {
		System.out.println("WebSocket強關才叫我..");
		users.remove(userSession);
		try {
			userSession.close();
		} catch (IOException e) {
			System.out.println("IOException好吵");
		}
	}

	private String buildJsonData(String username, String message) {
		// 範例： {"message":"系統訊息:連線成功!"}
		return "{\"message\":\"" + username + ":" + message + "\"}";
	}
}