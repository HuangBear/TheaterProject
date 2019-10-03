package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;
import com.web.service.BulletinService;

@Service
public class BulletinServiceImpl implements BulletinService {
	@Autowired
	BulletinDao dao;

	@Override
	@Transactional
	public List<BulletinBean> getExistenceBulletin(String str, String targete) {
		return dao.getExistenceBulletin(str, targete);
	}

	@Override
	@Transactional
	public List<List<BulletinBean>> getStatsBulletin(String str, String targete) {

		List<BulletinBean> getExistenceBulletin = dao.getExistenceBulletin(str, targete);
		switchImg(getExistenceBulletin);

		List<BulletinBean> getExpiredBulletin = dao.getExpiredBulletin(str);
		switchImg(getExpiredBulletin);

		List<BulletinBean> getDeadBulletin = dao.getDeadBulletin(str);
		switchImg(getDeadBulletin);

		List<List<BulletinBean>> statusBulletin = new ArrayList<>();
		statusBulletin.add(getExistenceBulletin);
		statusBulletin.add(getExpiredBulletin);
		statusBulletin.add(getDeadBulletin);

		return statusBulletin;
	}

	@Override
	@Test
	@Transactional
	public List<BulletinBean> getDiscount(String date) {
		List<BulletinBean> discount = dao.getDiscount(date);
		switchImg(discount);
		return discount;
	}

	@Override
	@Transactional
	public void insertNewBulletin(BulletinBean bb) {
		dao.insertBulletin(bb);
	}

	@Override
	@Transactional
	public BulletinBean getBulletinBeanById(Integer no) {
		BulletinBean bb = dao.getBulletinById(no);
		return bb;
	}

	@Override
	@Transactional
	public int updateBulletinBeanById(Integer id, Boolean bo) {
		int deleteReturn = dao.updateBulletindByBortingId(id, bo);
		return deleteReturn;
	}

	@Override
	@Transactional
	public List<BulletinBean> getSameBulletinByBortingId(Integer no) {
		List<BulletinBean> sameBulletinBeans = dao.getSameBulletinByBortingId(no);
		switchImg(sameBulletinBeans);
		return sameBulletinBeans;
	}

// 準備程式
	@Override
	public void switchImg(List<BulletinBean> bb) {
		for (BulletinBean eb : bb) {
			Integer discount = eb.getDiscount();
			switch (discount)
			{
			case 1:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountP.png");
				eb.setPay("滿");
				eb.setFree("送");
				break;
			case 2:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountT.png");
				eb.setPay("買");
				eb.setFree("送");
				break;
			default:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountN.png");
				eb.setPay(null);
				eb.setFree(null);
				break;
			}
		}
	}

}