package com.web.dao;

import java.util.List;

import com.web.entity.SeatBean;

public interface SeatDao {
	// new
	int saveSeat(SeatBean seat);

	// disable
	int deleteSeat(Integer seatId);

	int deleteAll();

	// update
	int updateSeat(SeatBean seat);

	// query
	SeatBean getSeat(String seatId);

	List<SeatBean> getAllSeats();

	List<SeatBean> getSeatsByTimeTable(Integer timeTableId);
}
