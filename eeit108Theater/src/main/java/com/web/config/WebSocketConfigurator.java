package com.web.config;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.service.EmployeeService;


@Configuration
@ComponentScan({"com.web"})
public class WebSocketConfigurator extends ServerEndpointConfig.Configurator {
	@Autowired
	EmployeeService serviceEmp;
	
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		
		sec.getUserProperties().put("username", "M" + "訪客");
		
		if (((HttpSession) request.getHttpSession()).getAttribute("LoginOK") != null) {
			String allClassName = ((HttpSession) request.getHttpSession()).getAttribute("LoginOK").getClass()
					.toString();
			String className = allClassName.substring(allClassName.lastIndexOf(".") + 1);
			if ("MemberBean".equals(className)) {
				MemberBean loginToken = (MemberBean) ((HttpSession) request.getHttpSession()).getAttribute("LoginOK");
				sec.getUserProperties().put("username", "M" + loginToken.getName());
			} else {
				sec.getUserProperties().put("username", "M" + "訪客");
			}
		} else if (((HttpSession) request.getHttpSession()).getAttribute("employeeBean1") != null) {
			String allClassName = ((HttpSession) request.getHttpSession()).getAttribute("employeeBean1").getClass()
					.toString();
			String className = allClassName.substring(allClassName.lastIndexOf(".") + 1);
			
			if ("EmployeeBean".equals(className)) {
				EmployeeBean loginToken = (EmployeeBean) ((HttpSession) request.getHttpSession()).getAttribute("employeeBean1");
				System.out.println(loginToken.getEmail());
				System.out.println(((HttpSession) request.getHttpSession()).getAttribute("positionsession"));
				String position=(String) ((HttpSession) request.getHttpSession()).getAttribute("positionsession");
				sec.getUserProperties().put("username",
						"E" + "["+position+"]"+  loginToken.getName());
			} else {
				sec.getUserProperties().put("username", "E" + "訪客");
			}
		} else {
			sec.getUserProperties().put("username", "M" + "訪客");
		}
	}
}