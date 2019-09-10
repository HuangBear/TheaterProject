package com.web.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.SeatDao;
import com.web.entity.SeatBean;

public class SeatDaoImpl implements SeatDao {

	@Autowired
	SessionFactory factory;

	public Boolean isExist(Integer seatNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SeatBean s WHERE s.no = :sno";
		if (session.createQuery(hql).setParameter("sno", seatNo).uniqueResult() != null)
			return true;
		return false;
	}

	@Override
	public int saveSeat(SeatBean seat) {
		Session session = factory.getCurrentSession();
		if (seat.getNo() != null)
			return 0;
		session.save(seat);
		return 1;
	}

	@Override
	public int deleteSeatByNo(Integer seatNo) {
		Session session = factory.getCurrentSession();
		if (seatNo == null || !isExist(seatNo))
			return 0;
		SeatBean seat = new SeatBean();
		seat.setNo(seatNo);		
		session.delete(seat);
		return 1;
	}

	@Override
	public int deleteSeatsByTimeTableNo(Integer timeTableNo) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE SeatBean s WHERE s.timeTableId = :tid";
		return session.createQuery(hql).setParameter("tid", timeTableNo).executeUpdate();
	}

	@Override
	public int deleteAll() {
		Session session = factory.getCurrentSession();
		String hql = "DELETE SeatBean";
		return session.createQuery(hql).executeUpdate();
	}

	@Override
	public int updateSeat(SeatBean seat) {
		if(!isExist(seat.getNo()))
			return 0;
		Session session = factory.getCurrentSession();
		session.update(seat);
		return 1;
	}

	@Override
	public int discontinueAll() {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE SeatBean s SET s.available = :false";
		return session.createQuery(hql).setParameter("false", Boolean.FALSE).executeUpdate();
	}

	@Override
	public int continueAll() {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE SeatBean s SET s.available = :true";
		return session.createQuery(hql).setParameter("true", Boolean.TRUE).executeUpdate();
	}

	@Override
	public SeatBean getSeatByNo(Integer seatNo) {
		return factory.getCurrentSession().get(SeatBean.class, seatNo);
	}
	
	@Override
	public SeatBean getSeat(Integer timeTableId, String row, String column) {
		String hql = "FROM SeatBean s WHERE s.timeTableId = :tid AND s.row = :row and s.column = :col";
		return (SeatBean) factory.getCurrentSession().createQuery(hql).setParameter("tid", timeTableId).setParameter("row", row).setParameter("col", column).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SeatBean> getAllSeats() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SeatBean";
		List<SeatBean> list = session.createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SeatBean> getAllAvailable() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SeatBean s WHERE s.available = :true";
		List<SeatBean> list = session.createQuery(hql).setParameter("true", Boolean.TRUE).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SeatBean> getSeatsByTimeTable(Integer timeTableNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SeatBean s WHERE s.timeTableId = :tid";
		List<SeatBean> list = session.createQuery(hql).setParameter("tid", timeTableNo).list();
		return list;
	}


}
