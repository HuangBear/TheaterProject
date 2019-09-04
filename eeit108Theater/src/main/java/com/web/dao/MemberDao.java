package com.web.dao;

import java.util.List;

import com.web.entity.MemberBean;

public interface MemberDao {
	// new
		int saveMember(MemberBean member);

		// disable
		int deleteMember(String memberId);
		
		int deleteAll();

		// update
		int updateMember(MemberBean member);

		// query
		MemberBean getMemberByNo(String memberNo);

		MemberBean getMemberByEmail(String email);

		MemberBean getMemberByMemberId(String memberId);

		List<MemberBean> getMembersByOwner(String memberId);

		List<MemberBean> getAllMembers();
}
