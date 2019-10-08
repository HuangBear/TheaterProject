package com.web.service;

import java.util.List;

import com.web.entity.SeatBean;
import com.web.entity.TheaterBean;
import com.web.entity.TimeTableBean;

public interface TheaterService {

	int save(TheaterBean tb);

	int update(TheaterBean tb);

	int delete(TheaterBean tb);

	TheaterBean getTheater(String theater);

	TheaterBean getTheaterByNo(Integer no);
	
	List<TheaterBean> getAllTheaters();

	List<SeatBean> getSeatsByTimeTable(Integer timeTableNo);

	String getTheaterStatus(String theater, Integer timeTableId);

	String getTheaterStatus(TimeTableBean time);

	String getTheaterStatus(TheaterBean tb, Integer timeTableId);

	String getTheaterStatus(TheaterBean tb, TimeTableBean time);

	String getTheaterStatus(String theater);

	String getTheaterStatus(TheaterBean tb);

}