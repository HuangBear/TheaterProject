package com.web.service.impl;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.web.entity.OrderBean;
import com.web.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	ServletContext context;
	
	final static String OFFICIAL_EMAIL = "eeit108sevenminusone@gmail.com";
	
	@Override
	public void sendEmail(OrderBean ob) throws MessagingException {
		if(ob == null)
			throw new MessagingException("the order is null");
		if(ob.getOwnerEmail() == null || ob.getOwnerEmail().length() == 0)
			throw new MessagingException("Illegal email address");
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		//prepare the content
		String builder = "<html>" +
				"<meta http-equiv='Content-Type' content='text/html;charset=UTF-8'>" +
				"<body>" + 
					"<div align='center' style='font-family: Arial, Helvetica, sans-serif'>" + 
							"<table cellpadding='5px' style='width: 50%;line-height: 35px; min-width: 350px; ; border-radius: 10px; white-space: nowrap;'>" + 
								"<thead align='center'>" + 
									"<tr>" + 
										"<td colspan='2'>" + 
											"<div><img src='cid:logoImg' style='width: 100%;border-radius: 5px;'></div>" + 
										"</td>" + 
									"</tr>" + 
									"<tr>" + 
										"<th colspan='2'>" + 
											"<div style='margin-bottom: 5px'>親愛的顧客您好，以下為本次購票資訊</div>" + 
										"</th>" + 
									"</tr>" + 
									"<tr>" + 
										"<th colspan='2'>" + 
											"<div style='background-color: lightgray;border-radius: 5px;padding-top: 2.5px;padding-bottom: 2.5px'> 訂單資料</div>" + 
										"</th>" + 
									"</tr>" + 
								"</thead>" + 
								"<tbody style='text-align:left;'>"+
									"<tr>"+
										"<th style='width:50%'>"+
											"取票序號"+
										"</th>"+
										"<th style='width:50%'>"+
											"#tradeNo"+
										"</th>"+
									"</tr>"+
									"<tr>"+
											"<th>"+
												"電影"+
											"</th>"+
											"<td>"+
												"#movieName"+
											"</td>"+
									"</tr>"+
									"<tr>"+
										"<th>"+
											"場次"+
										"</th>"+
										"<td>"+
											"#timeTable"+
										"</td>"+
									"</tr>"+
									"<tr>"+
										"<th>"+
											"座位"+
										"</th>"+
										"<td>"+
											"#seat"+
										"</td>"+
									"</tr>"+
									"<tr>"+
										"<th>"+
											"商品清單"+
										"</th>"+
											"<td>"+
											"#orderList"+
										"</td>"+
									"</tr>"+
									"<tr>"+
										"<th>"+
											"總計"+
										"</th>"+
										"<td>"+
											"#total"+
										"</td>"+
									"</tr>"+							
								"</tbody>"+
								"<tfoot>"+
									"<tr>"+
										"<td colspan='2'>"+
											"<div style='text-align:center;color:cornflowerblue'><b>7-1CINEMA</b></div>"+
										"</td>"+
									"</tr>"+
								"</tfoot>" +
							"</table>" + 
					"</div>" + 
				"</body>" + 
				"</html>";
		builder = builder.replace("#tradeNo", ob.getOrderId());
		builder = builder.replace("#movieName", "(" + ob.getTimeTable().getVersion() + ") " + ob.getTimeTable().getMovieName());
		builder = builder.replace("#timeTable", ob.getTimeTable().getStartDate() + " " + ob.getTimeTable().getStartTime());
		builder = builder.replace("#seat", ob.getSeatsString());
		builder = builder.replace("#orderList", ob.getOrderItemsDetail()); //to fix
		builder = builder.replace("#total", (ob.getTotalPrice()).toString());
		builder = builder.replace("#", "<br>");
		//prepare to send email
		helper.setFrom(OFFICIAL_EMAIL);
		helper.setTo(ob.getOwnerEmail());
		helper.setSubject("7-1 CINEMA 線上購票確認信");
		helper.setText(builder,	true);
		helper.addInline("logoImg", new File(context.getRealPath("/WEB-INF/resources/images/frontend/cinema.jpg")));
		mailSender.send(message);
	}

	@Override
	public void sendEmail(String to, String subject, String context) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setFrom(OFFICIAL_EMAIL);
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(context, false);
	}

	@Override
	public void sendEmail(String to, String subject, String context, boolean html) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setFrom(OFFICIAL_EMAIL);
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(context, html);		
	}

}
