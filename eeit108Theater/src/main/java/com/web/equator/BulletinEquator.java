package com.web.equator;

import com.github.dadiyang.equator.Equator;
import com.github.dadiyang.equator.GetterBaseEquator;
import com.web.entity.BulletinBean;

public class BulletinEquator {
	public boolean BEquator(BulletinBean bb, BulletinBean obb) {
		Equator equator = new GetterBaseEquator();
		System.out.println("出現false就是不同");
		if (!equator.isEquals(obb.getTitle(), bb.getTitle())) {
			System.out.println("BulletinEquator_getTitle=false");
			return false;
		} else if (!equator.isEquals(obb.getBortingId(), bb.getBortingId())) {
			System.out.println("BulletinEquator_getBortingId=false");
			return false;
		} else if (!equator.isEquals(obb.getContext(), bb.getContext())) {
			System.out.println("BulletinEquator_getContext=false");
			return false;
		} else if ((obb.getCoverImage() != bb.getCoverImage())) {
			System.out.println("BulletinEquator_getCoverImage=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscount(), bb.getDiscount())) {
			System.out.println("BulletinEquator_getDiscount=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountPriceBuy(), bb.getDiscountPriceBuy())) {
			System.out.println("BulletinEquator_getDiscountPriceBuy=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountPriceFree(), bb.getDiscountPriceFree())) {
			System.out.println("BulletinEquator_getDiscountPriceFree=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountTicketBuy(), bb.getDiscountTicketBuy())) {
			System.out.println("BulletinEquator_getDiscountTicketBuy=false");
			return false;
		} else if (!equator.isEquals(obb.getDiscountTicketFree(), bb.getDiscountTicketFree())) {
			System.out.println("BulletinEquator_getDiscountTicketFree=false");
			return false;
//		} else if (!equator.isEquals(obb.getEmployee().getNo(), bb.getEmployeeId())) {
//			System.out.println("BulletinEquator_getEmployee().getEmployeeId()=false");
//			return false;
		} else if (!equator.isEquals(obb.getEndDate(), bb.getEndDate())) {
			System.out.println("BulletinEquator_getEndDate=false");
			return false;
		} else if (!equator.isEquals(obb.getFileName(), bb.getFileName())) {
			System.out.println("BulletinEquator_getFileName=false");
			return false;
		} else if (!equator.isEquals(obb.getStartDate(), bb.getStartDate())) {
			System.out.println("BulletinEquator_getStartDate=false");
			return false;
//		} else if  (!equator.isEquals(obb.getNo(), bb.getNo())) {
//			System.out.println("BulletinEquator_getNo=false");
//			return false;
		} else if (!equator.isEquals(obb.getAvailable(), bb.getAvailable())) {
			System.out.println("BulletinEquator_getAvailable=false");
			return false;
		}
		return true;
	}
}
