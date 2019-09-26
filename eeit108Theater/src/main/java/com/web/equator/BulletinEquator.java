package com.web.equator;

import com.github.dadiyang.equator.Equator;
import com.github.dadiyang.equator.GetterBaseEquator;
import com.web.entity.BulletinBean;

public class BulletinEquator {
	public boolean BEquator(BulletinBean bb, BulletinBean obb) {
		Equator equator = new GetterBaseEquator();

		if (!equator.isEquals(obb.getAvailable(), bb.getAvailable())) {
			System.out.println("getAvailable=false");
			return false;
		} else if (!equator.isEquals(obb.getBortingId(), bb.getBortingId())) {
			System.out.println("getBortingId=false");
			return false;
		} else if (!equator.isEquals(obb.getContext(), bb.getContext())) {
			System.out.println("getContext=false");
			return false;
		} else if ((obb.getCoverImage() != bb.getCoverImage())) {
			System.out.println("getCoverImage=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscount(), bb.getDiscount())) {
			System.out.println("getDiscount=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountPriceBuy(), bb.getDiscountPriceBuy())) {
			System.out.println("getDiscountPriceBuy=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountPriceFree(), bb.getDiscountPriceFree())) {
			System.out.println("getDiscountPriceFree=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountTickBuy(), bb.getDiscountTickBuy())) {
			System.out.println("getDiscountTickBuy=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountTickFree(), bb.getDiscountTickFree())) {
			System.out.println("getDiscountTickFree=false");
			return false;
		} else if (!equator.isEquals(obb.getEmployee().getEmployeeId(),
				bb.getEmployee().getEmployeeId())) {
			System.out.println("getEmployee().getEmployeeId()=false");
			return false;
		} else if (!equator.isEquals(obb.getEndDate(), bb.getEndDate())) {
			System.out.println("getEndDate=false");
			return false;
		} else if (!equator.isEquals(obb.getFileName(), bb.getFileName())) {
			System.out.println("getFileName=false");
			return false;
		} else if (!equator.isEquals(obb.getStartDate(), bb.getStartDate())) {
			System.out.println("getStartDate=false");
			return false;
//		} else if  (!equator.isEquals(obb.getNo(), bb.getNo())) {
//			System.out.println("getNo=false");
//			return false;
		} else if (!equator.isEquals(obb.getTitle(), bb.getTitle())) {
			System.out.println("getTitle=false");
			return false;
		}
		return true;
	}
}
