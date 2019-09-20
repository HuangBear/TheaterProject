package com.web.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;

@Service
public class BulletinServiceImpl {
	@Autowired
	BulletinDao dao;

	@Transactional
	public List<BulletinBean> getStatusBulletin() {
		List<BulletinBean> list = dao.getStatusBulletin();
		for (BulletinBean bb : list) {
			Integer discount = bb.getDiscount();
			switch (discount)
			{
			case 1:
				bb.setImgUrlString("/images/icons/backstage/bulletin/discountP.png");
				bb.setPay("滿");
				bb.setFree("送");
				break;
			case 2:
				bb.setImgUrlString("/images/icons/backstage/bulletin/discountT.png");
				bb.setPay("買");
				bb.setFree("送");
				break;
			default:
				bb.setImgUrlString("/images/icons/backstage/bulletin/discountN.png");
				bb.setPay(null);
				bb.setFree(null);
				break;
			}
		}
		return list;
	}

	@Transactional
	public void insertNewBulletin(BulletinBean bb) {
		bb.setCount(bb.getCount()+1);
		dao.insertBulletin(bb);
	}

	@Transactional
	public BulletinBean getBulletinBeanById(Integer no) {
		BulletinBean bb = dao.getBulletinById(no);
		return bb;
	}
	
	@Transactional
	public BulletinBean updateBulletinBeanById(BulletinBean bb) {
		 dao.updateBulletin(bb);
		return bb;
	}

}