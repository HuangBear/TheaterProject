package com.web.dao;

import java.util.List;

import com.web.entity.SeatBean;

public interface SeatDao {
	// new
	int saveSeat(SeatBean seat);

	// disable
	int deleteSeatByNo(Integer seatNo);
	
	int deleteSeatsByTimeTableNo(Integer timeTableNo);
	
	int deleteAll();

	// update
	int updateSeat(SeatBean seat);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	SeatBean getSeatByNo(Integer seatNo);
	
	SeatBean getSeat(Integer timeTableId, String row, Integer column);

	List<SeatBean> getAllSeats();

	List<SeatBean> getAllAvailable();

	List<SeatBean> getSeatsByTimeTable(Integer timeTableNo);
}
