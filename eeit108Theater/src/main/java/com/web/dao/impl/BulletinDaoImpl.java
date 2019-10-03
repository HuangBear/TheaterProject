package com.web.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;

@Repository
public class BulletinDaoImpl implements BulletinDao {

	@Autowired
	SessionFactory factory;

	@Override
	@SuppressWarnings("unchecked")
	public List<BulletinBean> getExistenceBulletin(String str, String targete) {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("FROM BulletinBean b WHERE b.countNum = (select MAX(countNum) from BulletinBean "
				+ "bb WHERE bb.bortingId = b.bortingId and bb.endDate > getdate() and bb.available ="
				+ "true group by bb.bortingId) order by b.").append(str).append(" ")
				.append(targete);
//		String in = "b." + targete;DESC
//		System.out.println(in);
		list = session.createQuery(sb.toString()).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<BulletinBean> getExpiredBulletin(String targete) {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("FROM BulletinBean b WHERE b.countNum = (select MAX(countNum) from "
				+ "BulletinBean bb WHERE bb.bortingId = b.bortingId and bb.endDate "
				+ "< getdate() and bb.available =true group by bb.bortingId) " + "order by b.")
				.append(targete).append(" DESC");
		list = session.createQuery(sb.toString()).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<BulletinBean> getDeadBulletin(String targete) {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("FROM BulletinBean b WHERE b.countNum = (select MAX(countNum) from "
				+ "BulletinBean bb WHERE bb.bortingId = b.bortingId and bb.available = 0 "
				+ "group by bb.bortingId) order by b.").append(targete).append(" DESC");
		list = session.createQuery(sb.toString()).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<BulletinBean> getSameBulletinByBortingId(Integer no) {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		list = session.createQuery(
				"FROM BulletinBean b WHERE b.bortingId = (select bb.bortingId from BulletinBean bb WHERE bb.no = :no )order by b.countNum desc")
				.setParameter("no", no).list();
//		System.out.println(list);
		return list;
	}

	@Override
	public int updateBulletindByBortingId(Integer no, Boolean bo) {
		Session session = factory.getCurrentSession();
		int deleteReturn = session.createQuery(
				"UPDATE BulletinBean b SET b.available = :ava WHERE b.bortingId = (select bb.bortingId from BulletinBean bb WHERE bb.no =:no )  ")
				.setParameter("no", no).setParameter("ava", bo).executeUpdate();
		return deleteReturn;
	}

	@Override
	public void insertBulletin(BulletinBean bb) {
		Session session = factory.getCurrentSession();
		EmployeeBean eb = getEmployeeById(bb.getEmployeeId());
		bb.setEmployee(eb);
		session.save(bb);
	}

	@Override
	public EmployeeBean getEmployeeById(Integer employeeId) {
		EmployeeBean eb = null;
		Session session = factory.getCurrentSession();
		eb = session.get(EmployeeBean.class, employeeId);
		return eb;
	}

	@Override
	public BulletinBean getBulletinById(Integer bulletin_no) {
		BulletinBean bb = null;
		Session session = factory.getCurrentSession();
		bb = session.get(BulletinBean.class, bulletin_no);
		return bb;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<BulletinBean> getDiscount(String date) {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		list = session.createQuery(
				"FROM BulletinBean b WHERE b.countNum = (select MAX(countNum) from BulletinBean bb WHERE bb.bortingId = b.bortingId  and bb.endDate > getdate() and bb.startDate < :date  and discount != 0 and bb.available =true group by bb.bortingId) order by b.no DESC ")
				.setParameter("date", date).list();
		return list;
	}

	@Override
	public Integer getBuelltinPreMoon(String date) {
		String frist = date + "-01 00:00:00";
		String last = date + "-31 00:00:00";

		Date fristDate = null, lastDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		try {
			fristDate = sdf.parse(frist);
			lastDate = sdf.parse(last);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(fristDate);
		System.out.println(lastDate);
		Session session = factory.getCurrentSession();
		Object buelltinPreMoon = session
				.createQuery("SELECT COUNT(*) FROM BulletinBean b WHERE b.countNum = "
						+ "(select MAX(countNum) from BulletinBean bb WHERE bb.bortingId = "
						+ "b.bortingId and bb.postTime BETWEEN :fristDate and :lastDate)")
				.setParameter("fristDate", fristDate).setParameter("lastDate", lastDate)
				.uniqueResult();
		int bPM = Integer.parseInt(buelltinPreMoon.toString());
		System.out.println(bPM);
		return bPM;
	}

//	@Override
	public Integer getBuelltinPreYear(String date) {
		String fristDate = date + "-01-01";
		String lastDate = date + "-12-31";
		Session session = factory.getCurrentSession();
		Object buelltinPreYear = session
				.createQuery("SELECT COUNT(*) FROM BulletinBean b WHERE b.countNum = "
						+ "(select MAX(countNum) from BulletinBean bb WHERE bb.bortingId = "
						+ "b.bortingId and bb.postTime BETWEEN :fristDate and :lastDate)")
				.setParameter("fristDate", fristDate).setParameter("lastDate", lastDate)
				.uniqueResult();
		int bPY = Integer.parseInt(buelltinPreYear.toString());
		System.out.println(bPY);
		return bPY;
	}
}
