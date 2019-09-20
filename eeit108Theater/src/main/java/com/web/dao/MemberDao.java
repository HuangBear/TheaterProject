package com.web.dao;

import java.util.List;

import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;

public interface MemberDao {
	// new
	int saveMember(MemberBean member);

	// disable
	int deleteMemberByNo(Integer memberNo);

	int deleteMemberById(String memberId);

	int deleteAll();

	// update
	int updateMember(MemberBean member);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架
	
	// query
	MemberBean checkMemberEmail(String email);

	MemberBean getMemberByNo(Integer memberNo);

	MemberBean getMemberByEmail(String email);

	MemberBean getMemberById(String memberId);
	
	MemberBean getMemberBeanByEmailPassword(String email,String password);

	List<MemberBean> getAllMembers();

	List<MemberBean> getAllAvailable();
	
	Object getPermissionByMemberEmail(String email);
}
