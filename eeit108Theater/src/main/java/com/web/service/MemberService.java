package com.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.web.entity.MemberBean;

public interface MemberService {

	void insertMember(MemberBean empBean);
	 void updateMember(MemberBean empBean);
	 void downGradeMember(MemberBean empBean);
	 void deleteMember(Integer no);
	 MemberBean findMemberByPrimaryKey(Integer no);
	 MemberBean findMemberByEmail(String email);
	 List<MemberBean> getAllMembers();
	 public MemberBean addMember(String name,String email,String password,String phoneNum);
	 public Boolean checkMemberEmail(String email);
	 public Integer save(MemberBean empBean);
	 public MemberBean checkEmailPassword(String email, String password);
	 void updateMemberStatus(MemberBean memBean);
	 public void emailValidate(MemberBean memBean, HttpServletRequest request);
	 void activeUser(String emailCode);
	 MemberBean findMemberByCode(String code);
}
