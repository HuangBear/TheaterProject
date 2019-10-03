package com.web.dao;

import java.util.List;

import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;

public interface BulletinDao {

	List<BulletinBean> getExistenceBulletin(String str, String targete);

	List<BulletinBean> getExpiredBulletin(String targete);

	List<BulletinBean> getDeadBulletin(String targete);

	List<BulletinBean> getSameBulletinByBortingId(Integer no);

	int updateBulletindByBortingId(Integer no, Boolean bo);

	void insertBulletin(BulletinBean bb);

	EmployeeBean getEmployeeById(Integer employeeId);

	BulletinBean getBulletinById(Integer bulletin_no);

	List<BulletinBean> getDiscount(String date);

	Integer getBuelltinPreMoon(String date);

	Integer getBuelltinPreYear(String date);

}
