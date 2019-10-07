package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Theater", uniqueConstraints = { @UniqueConstraint(columnNames = { "theater" }) })
public class TheaterBean {
	public final static String NULL_SEAT = "nullSeat";
	public final static String PRESERVE_SEAT = "preserveSeat";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "theater_no")
	private Integer no;
	private String theater;
	private Integer rowCnt = 10;
	private Integer[] spaceRow = new Integer[] {};
	private Integer zone = 3;
	private Integer middle = 10;
	private Integer side = 5;
	private Integer subside = 2;
	@Column(columnDefinition = "VARBINARY(max)")
	private String[] optionSeat = new String[] {};

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public Integer getZone() {
		return zone;
	}

	public void setZone(Integer zone) {
		this.zone = zone;
	}

	public Integer getMiddle() {
		return middle;
	}

	public void setMiddle(Integer middle) {
		this.middle = middle;
	}

	public Integer getSide() {
		return side;
	}

	public void setSide(Integer side) {
		this.side = side;
	}

	public Integer getSubside() {
		return subside;
	}

	public void setSubside(Integer subside) {
		this.subside = subside;
	}

	public String[] getOptionSeat() {
		return optionSeat;
	}

	public void setOptionSeat(String[] optionSeat) {
		this.optionSeat = optionSeat;
	}

	public Integer getRowCnt() {
		return rowCnt;
	}

	public void setRowCnt(Integer rowCnt) {
		this.rowCnt = rowCnt;
	}

	public Integer[] getSpaceRow() {
		return spaceRow;
	}

	public void setSpaceRow(Integer[] spaceRow) {
		this.spaceRow = spaceRow;
	}

	public Integer getMaxSeat() {
		Integer result = 0;
		for(Integer cnt : this.getPattern()) {
			result+=cnt;
		}
		return result;
	}

	public Integer[] getPattern() {
		Integer[] pattern = null;
		// System.out.println("zone = " + getZone());
		switch (this.zone) {
		case 1:
			pattern = new Integer[] { this.middle };
			break;
		case 2:
			pattern = new Integer[] { this.side, this.middle };
			break;
		case -2:
			pattern = new Integer[] { this.middle, this.side };
			break;
		default:
		case 3:
			pattern = new Integer[] { this.side, this.middle, this.side };
			break;
		case 4:
			pattern = new Integer[] { this.side, this.middle, this.middle, this.side };
			break;
		case 5:
			pattern = new Integer[] { this.subside, this.side, this.middle, this.side, this.subside };
			break;
		}
		return pattern;
	}
	
	public Integer getTheaterWidth() {
		int maxSeat = getMaxSeat();
		int seatWidth = 25;
		int paddingSeat = 6;
		
		return (maxSeat + paddingSeat + (zone-1))*seatWidth;
	}
}
