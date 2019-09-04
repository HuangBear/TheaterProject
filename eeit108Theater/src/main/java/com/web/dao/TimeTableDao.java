package com.web.dao;

import java.util.List;

import com.web.entity.TimeTableBean;

public interface TimeTableDao {
	// new
		int saveTimeTable(TimeTableBean timeTable);

		// disable
		int deleteTimeTable(Integer timeTableId);

		int deleteAll();

		// update
		int updateTimeTable(TimeTableBean timeTable);
		
		// query
		TimeTableBean getTimeTable(String timeTableId);

		List<TimeTableBean> getTimeTablesByMovie(String movieName);
		
		List<TimeTableBean> getAllTimeTables();
}
