package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.BullentinBean;

public interface BullentinDao {
	List<Date> getRangeDate();

	Integer[] getDiscont();

	List<BullentinBean> saveBullentin();
	
	List<BullentinBean> updateBullentin();

	List<Date> getStartDate();
	
	
}
