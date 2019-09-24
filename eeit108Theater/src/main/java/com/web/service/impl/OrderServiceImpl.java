package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.OrderDao;
import com.web.dao.SeatDao;
import com.web.entity.OrderBean;
import com.web.entity.SeatBean;
import com.web.service.OrderService;

@Transactional
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao odao;
	@Autowired
	SeatDao sdao;
	
	@Override
	public int saveOrder(OrderBean order) {
		
		return odao.saveOrder(order);
	}

	
	@Override
	public int deleteOrderByNo(Integer orderNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int updateOrder(OrderBean order) {
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
	public OrderBean getOrderByNo(Integer orderNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int setSeatToOrder(OrderBean ob, String[] seats) {
		int tid = ob.getTimeTable().getNo();
		System.out.println("tid = " + tid);
		List<SeatBean> list = new ArrayList<>();
		for(String rowCol : seats) {
			String row = rowCol.substring(0,1);
			System.out.println("row = " + row);
			Integer col = Integer.valueOf(rowCol.substring(1));
			System.out.println("col = " + col);
			if(sdao.getSeat(tid, row, col) != null) {
				return -1;
			}
			SeatBean sb = new SeatBean(tid, row, col);
			list.add(sb);
		}
		ob.setSeats(list);
		System.out.println("===setSeatToOrder Result:\n" + list);
		return seats.length;
	}
	
	@Override
	public List<OrderBean> getOrdersByOwnerId(String memberId) {
		return odao.getOrdersByOwnerId(memberId);
	}

	
	@Override
	public List<OrderBean> getAllOrders() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<OrderBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<OrderBean> getGuestOrders(String ownerEmail, String ownerPhone, Boolean checkStatus) {
		return odao.getGuestOrders(ownerEmail, ownerPhone, checkStatus);
	}


	@Override
	public List<OrderBean> getMemberOrders(String memberId, Boolean checkStatus) {
		return odao.getMemberOrders(memberId, checkStatus);
	}

}
