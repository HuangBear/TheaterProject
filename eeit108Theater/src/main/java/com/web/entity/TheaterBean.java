package com.web.entity;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Theater", uniqueConstraints = { @UniqueConstraint(columnNames = { "theater" }) })
public class TheaterBean implements Serializable {
	private static final long serialVersionUID = -690053149315028695L;
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
	/**
	 * per optionSeat contains rowCol & option, and is separated by '='.
	 * <p>
	 * e.g. {"H1=nullSeat","H2=nullSeat","H3=preserveSeat"}
	 */
	@Column(columnDefinition = "VARBINARY(max)")
	private String[] nullSeat = new String[] {};
	/**
	 * per optionSeat contains rowCol & option, and is separated by '='.
	 * <p>
	 * e.g. {"H1=preserveSeat","H2=preserveSeat","H3=preserveSeat"}
	 */
	@Column(columnDefinition = "VARBINARY(max)")
	private String[] preserveSeat = new String[] {};

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

		String[] result = new String[this.preserveSeat.length + this.nullSeat.length];
		int i = 0;
		for (int j = 0; j < preserveSeat.length; i++, j++) {
			result[i] = preserveSeat[j] + "=" + PRESERVE_SEAT;
		}
		for (int k = 0; k < nullSeat.length; i++,k++) {
			result[i] = nullSeat[k] + "=" + NULL_SEAT;
		}
		
		//System.out.println("get option seat pre seat = " + Arrays.toString(preserveSeat));
		//System.out.println("get option seat null seat = " + Arrays.toString(nullSeat));
		//System.out.println("get option seat = " + Arrays.toString(result));
		return result;
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
		for (Integer cnt : this.getPattern()) {
			result += cnt;
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

		return (maxSeat + paddingSeat + (zone - 1)) * seatWidth;
	}

	public Integer getCapacity() {
		int total = getMaxSeat() * this.rowCnt;
		Map<String, String> map = getOptionSeatMap();
		Set<String> keys = map.keySet();
		for (String key : keys) {
			if (map.get(key).equals(NULL_SEAT)) {
				total--;
			}
		}
		return total;
	}

	public Map<String, String> getOptionSeatMap() {
		Map<String, String> map = new HashMap<>();
		for (String option : getOptionSeat()) {
			String[] temp = option.split("=");
			map.put(temp[0], temp[1]);
		}
		return map;
	}

	public String[] getNullSeat() {
		return nullSeat;
	}

	public void setNullSeat(String[] nullSeat) {
		this.nullSeat = nullSeat;
	}

	public String[] getPreserveSeat() {
		return preserveSeat;
	}

	public void setPreserveSeat(String[] preserveSeat) {
		this.preserveSeat = preserveSeat;
	}

	public String toString() {
		String result = this.theater + "|" + this.rowCnt + "|" + this.zone + "|" + this.middle + "|" + this.side + "|"
				+ this.subside + "|";
		
		
		if (this.spaceRow != null && this.spaceRow.length != 0) {
			result += spaceRow[0];
			for (int i = 1; i < spaceRow.length; i++) {
				result += "," + spaceRow[i];
			}
		} else {
			result += " ";
		}
		result += "|";
		if (this.nullSeat != null && this.nullSeat.length != 0) {
			result += nullSeat[0];
			for (int i = 1; i < nullSeat.length; i++) {
				result += "," + nullSeat[i];
			}
		} else {
			result += " ";
		}
		result += "|";
		if (this.preserveSeat != null && this.preserveSeat.length != 0) {
			result += preserveSeat[0];
			for (int i = 1; i < preserveSeat.length; i++) {
				result += "," + preserveSeat[i];
			}
		} else {
			result += " ";
		}
		result += "|";
		return result;
	}
}
