package com.web.dao;

import java.util.List;

import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;

public interface BulletinDao {

	List<BulletinBean> getExistenceBulletin();

	List<BulletinBean> getExpiredBulletin();

	List<BulletinBean> getDeadBulletin();

	int updateBulletindByBortingId(Integer no, Boolean bo);

	void insertBulletin(BulletinBean bb);

	EmployeeBean getEmployeeById(Integer employeeId);

	BulletinBean getBulletinById(Integer bulletin_no);

	 List<BulletinBean> getSameBulletinByBortingId(Integer no);

}
