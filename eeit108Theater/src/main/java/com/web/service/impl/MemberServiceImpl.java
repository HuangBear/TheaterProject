package com.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	//	oldMemBean.setAvailable(memBean.getAvailable());
		
		if(memBean.getMemberImage()!=null) {
		oldMemBean.setMemberImage(memBean.getMemberImage());
		oldMemBean.setImageFileName(memBean.getImageFileName());
		}
	//	oldMemBean.setPermission(memBean.getPermission());
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
		return null;
	}

	@Override
	public List<MemberBean> getAllMembers() {
		// TODO Auto-generated method stub
		return null;
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
			
			try {
				memberBean.setBirthday(ssdf.parse(memberBean.getBirthdayString()));  //setmember生日 將輸入的string 轉成date type
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			memberBean.setRegisterTime(new Date()); //set member註冊時間 (設計的表格是設定not null 一定要填)
			memberBean.setAvailable(true); //set member Available 預設true:在職 false:停權
			memberBean.setCommentPermission(true); //set member Permission 預設true
			memberBean.setBanCounter(0);
			//save member 時 如果想要依照需求額外儲存內容 可加在下面
			
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

}
