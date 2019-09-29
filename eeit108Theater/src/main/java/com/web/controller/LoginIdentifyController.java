package com.web.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.web.service.MemberService;

@Controller
public class LoginIdentifyController {
	@Autowired
	MemberService service;
	@Autowired
	ServletContext context;
	
	public static final String CLIENT_ID = "309951267841-3oupgh1elatdub7tc7f4iah7eorg5h31.apps.googleusercontent.com";
	public static final String REDIRECT_URI = "http://localhost:8080/eeit108Theater/";
	
	
	@RequestMapping("/googleAccount")
	public void GoogleLoginPost(@RequestParam("Token") String Token, HttpServletResponse response,HttpSession session,
			HttpServletRequest request) {
		GoogleIdToken googleToken= null;
		try {
			googleToken = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance())
					.setAudience(Collections.singletonList(LoginIdentifyController.CLIENT_ID)).build()
					.verify(Token);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (googleToken != null) {
			System.out.println("驗證成功.");
			Payload payload = googleToken.getPayload();

			String gmail = payload.getEmail();
			String name = (String) payload.get("name");
			System.out.println("name : " + name);
			String pictureURL = (String) payload.get("picture");

			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);

	
	}
}
	
}
