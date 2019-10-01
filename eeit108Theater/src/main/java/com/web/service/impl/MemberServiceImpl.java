package com.web.service.impl;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MemberDao;
import com.web.entity.MemberBean;
import com.web.service.MemberService;
import com.web.util.SecurityCipher;

@Transactional
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	ServletContext context;
	
	@Override
	public void insertMember(MemberBean memBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(MemberBean memBean) {
		MemberBean oldMemBean=memberDao.getMemberByNo(memBean.getNo());
		oldMemBean.setName(memBean.getName());
		oldMemBean.setMemberId(memBean.getMemberId());
		oldMemBean.setEmail(memBean.getEmail());
		oldMemBean.setPhoneNum(memBean.getPhoneNum());
		oldMemBean.setPassword(memBean.getPassword());
		oldMemBean.setGender(memBean.getGender());
		oldMemBean.setAboutMe(memBean.getAboutMe());
		
		if(memBean.getMemberImage()!=null) {
		oldMemBean.setMemberImage(memBean.getMemberImage());
		oldMemBean.setImageFileName(memBean.getImageFileName());
		}
	//	oldMemBean.setPermission(memBean.getPermission());
		memberDao.updateMember(oldMemBean);
		
	}
	@Override
	public void updateMemberStatus(MemberBean memBean) {
		MemberBean oldMemBean=memberDao.getMemberByNo(memBean.getNo());
		oldMemBean.setName(memBean.getName());
		
		
		oldMemBean.setBanCounter(memBean.getBanCounter());
		oldMemBean.setAvailable(memBean.getAvailable());
		oldMemBean.setCommentPermission(memBean.getCommentPermission());
		
		
		
	
		memberDao.updateMember(oldMemBean);
		
	}
	@Override
	public void downGradeMember(MemberBean memBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(Integer no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberBean findMemberByPrimaryKey(Integer no) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByNo(no);
	}

	@Override
	public MemberBean findMemberByEmail(String email) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByEmail(email);
	}

	@Override
	public List<MemberBean> getAllMembers() {
		// TODO Auto-generated method stub
		return memberDao.getAllMembers();
	}

	@Override
	public MemberBean addMember(String name, String email, String password, String phoneNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean checkMemberEmail(String email) {
		Boolean result = true;

		if (memberDao.checkMemberEmail(email) == null) {
			result = false;
		}
		return result;
	}

	@Override
	public Integer save(MemberBean memberBean) {
		if( memberBean !=null) {
			System.out.println("member insert not null");
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
			
			if(memberBean.getBirthdayString()!=null) {
			try {
				memberBean.setBirthday(ssdf.parse(memberBean.getBirthdayString()));  //setmember生日 將輸入的string 轉成date type
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
			memberBean.setRegisterTime(new Date()); //set member註冊時間 (設計的表格是設定not null 一定要填)
			memberBean.setAvailable(true); //set member Available 預設true:在職 false:停權
			memberBean.setCommentPermission(true); //set member Permission 預設true
			memberBean.setBanCounter(0);
			memberBean.setAboutMe("該會員尚未填寫'關於我'，可於會員資料編輯中填寫，方便大家認識你喔。");;
			//save member 時 如果想要依照需求額外儲存內容 可加在下面
			System.out.println("Going to memberRegisterDAO!");
			memberDao.saveMember(memberBean);
			
		}else {
			System.out.println("member insert null");
		}
		
		return null;
	}

	@Override
	public MemberBean checkEmailPassword(String email, String password) {
		MemberBean mb=new MemberBean();
		mb=null;
		String ercryptPwd = SecurityCipher.encryptString(password);
		List<MemberBean> list=memberDao.getAllMembers();
		for(MemberBean memberBean:list) {
			if(memberBean.getEmail().equals(email)&& memberBean.getPassword().equals(ercryptPwd)){
				mb=memberBean;
			}
		}
		
		return mb;
	}

	@Override
	public void emailValidate(MemberBean memBean, HttpServletRequest request) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
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
												"<div style='margin-bottom: 5px'>親愛的顧客您好，感謝您註冊本網站會員</div>" + 
											"</th>" + 
										"</tr>" + 
										"<tr>" + 
											"<th colspan='2'>" + 
												"<div style='background-color: lightgray;border-radius: 5px;padding-top: 2.5px;padding-bottom: 2.5px'>信箱驗證信</div>" + 
											"</th>" + 
										"</tr>" + 
									"</thead>" + 
									"<tbody style='text-align:left;'>"+
										"<tr>"+
											"<th style='width:50%'>"+
												"會員名稱 "+
											"</th>"+
											"<th style='width:50%'>"+
											memBean.getName()+
											"</th>"+
										"</tr>"+
										"<tr>"+
												"<th>"+
													"連結驗證"+
												"</th>"+
												"<td>"+
												"<h4><a href='" + request.getScheme() + "://"
												+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
												+ "/registerEmail?code="+memBean.getEmailCode()+"'>"+ "點此連結驗證信箱</a></h4>"+
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
			helper.setFrom("eeit108sevenminusone@gmail.com");// 發件人
			helper.setTo(memBean.getEmail());// 收件人
			helper.setSubject("7-1 CINEMA影城  會員認證信");// 主題
//			helper.setText("<html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><body>"
//					+ "<h3>親愛的會員 " + memBean.getName()+ " 您好" + "</h3><br><h4>感謝您註冊本網站會員 </h4> " + "<h4><a href='" + request.getScheme() + "://"
//					+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
//					+ "/registerEmail?code="+memBean.getEmailCode()+"'>"+ "請點此連結驗證信箱</a></h4><br> <h3><p> 7-1 CINEMA 團隊 </p></h3>" + "</body></html>", true);// 正文
			helper.setText(builder,	true);
			helper.addInline("logoImg", new File(context.getRealPath("/WEB-INF/resources/images/frontend/cinema.jpg")));
		
		} catch (MessagingException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		mailSender.send(message);
		System.out.println("發送完成");
	}
	
	@Override
	public void activeUser(String emailCode) {
		memberDao.activeUser(emailCode);
	}

	@Override
	public MemberBean findMemberByCode(String code) {
		// TODO Auto-generated method stub
		return memberDao.findMemberByCode(code);
	}

}
