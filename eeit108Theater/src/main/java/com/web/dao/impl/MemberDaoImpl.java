package com.web.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.MemberDao;
import com.web.entity.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;
	
	@Override
	public int saveMember(MemberBean member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMemberByNo(Integer memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMemberById(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(MemberBean member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int discontinueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int continueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberBean getMemberByNo(Integer memberNo) {
		return factory.getCurrentSession().get(MemberBean.class, memberNo);
	}

	@Override
	public MemberBean getMemberByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberBean getMemberById(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberBean> getAllMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

}
