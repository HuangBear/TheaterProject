package com.web.dao;

import java.util.List;

import com.web.entity.BulletinBean;

public interface BulletinDao {

	void insertBulletin(BulletinBean bb);

	void deletecBulletin(Integer bullentin_no);

	List<BulletinBean> getStatusBulletin();

	void updateBulletin(BulletinBean bb);

	public BulletinBean getBulletinById(Integer bulletin_no);
}
