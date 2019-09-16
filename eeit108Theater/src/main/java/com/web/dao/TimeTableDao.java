package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.TimeTableBean;

public interface TimeTableDao {
	// new
	int saveTimeTable(TimeTableBean timeTable);

	// disable
	int deleteTimeTableByNo(Integer timeTableNo);

	int deleteAll();

	// update
	int updateTimeTable(TimeTableBean timeTable);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	TimeTableBean getTimeTableByNo(Integer timeTableNo);

	List<TimeTableBean> getTimeTablesByMovie(String movieName);

	List<TimeTableBean> getTimeTablesByMovieVersion(String movieName, String version);

	List<TimeTableBean> getAllTimeTables();

	List<TimeTableBean> getAllAvailable();
	
	List<TimeTableBean> getStartTimeByMovie(String movieName);
}
