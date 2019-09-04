package com.web.dao;

import java.util.List;

import com.web.entity.BullentinBean;

public interface BullentinDao {

	void saveBullentin(BullentinBean bb);

	void deletecBullentin(Integer bullentin_no);

	List<BullentinBean> getBullentin();

	void updateBullentin(BullentinBean bb);
}
