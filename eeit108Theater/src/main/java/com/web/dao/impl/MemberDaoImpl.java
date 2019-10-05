package com.web.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
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
		System.out.println("Going to Register for one member!");
		Session session = factory.getCurrentSession();

		return (int) session.save(member);
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
		Session session = factory.getCurrentSession();
		session.update(member);

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
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean e WHERE e.email = :email";
		System.out.println("執行HQL請求 get MemberBean ByEmail");
		mb = (MemberBean) session.createQuery(hql).setParameter("email", email).uniqueResult();
		System.out.println("取得SQL回應 : MemberBean or null");
		return mb;

	}

	@Override
	public MemberBean getMemberById(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMembers() {
		String hql = "FROM MemberBean";
		Session session = null;
		List<MemberBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<MemberBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public MemberBean getMemberBeanByEmailPassword(String email, String password) {
		Session session = null;
		session = factory.getCurrentSession();
		Query query = session.createNativeQuery(
				"SELECT * FROM Member WHERE email = :email AND password = :password ",
				MemberBean.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		Iterator iterator = query.getResultList().iterator();
		MemberBean mb = null;
		while (iterator.hasNext()) {
			mb = (MemberBean) iterator.next();
		}
		return mb;
	}

	@Override
	public MemberBean checkMemberEmail(String email) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean e WHERE e.email = :email";

		mb = (MemberBean) session.createQuery(hql).setParameter("email", email).uniqueResult();
		return mb;
	}

	@Override
	public Object getPermissionByMemberEmail(String email) {
		Session session = factory.getCurrentSession();
		Query query = session.createNativeQuery(
				"SELECT Permission FROM Member WHERE email = :email  ", MemberBean.class);
		query.setParameter("email", email);
		Object result = query.getSingleResult();
		System.out.println(result);
		// return (List<EmployeeBean>)query.getResultList();
		return result;
	}

	@Override
	public int activeUser(String emailCode) {

		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean set emailActiveStatus = 1 WHERE emailCode= :emailCode";
		int mmb = 0;
		mmb = session.createQuery(hql).setParameter("emailCode", emailCode).executeUpdate();
		System.out.println("hash=" + emailCode);
		System.out.println("mmb=" + mmb);

		return mmb;
	}

	@Override
	public MemberBean findMemberByCode(String code) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean e WHERE e.emailCode = :emailCode";

		mb = (MemberBean) session.createQuery(hql).setParameter("emailCode", code).uniqueResult();
		return mb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberPerMoon(Date firstDate, Date lastDate) {
		Session session = factory.getCurrentSession();
		List<MemberBean> list = new ArrayList<>();
		list = session
				.createQuery("FROM MemberBean m WHERE m.registerTime "
						+ "BETWEEN :fristDate and :lastDate)")
				.setParameter("fristDate", firstDate).setParameter("lastDate", lastDate).list();
		System.out.println(list);
		return list;
	}

}
