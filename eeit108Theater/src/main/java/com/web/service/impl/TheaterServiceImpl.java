package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.tribes.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.SeatDao;
import com.web.dao.TheaterDao;
import com.web.entity.SeatBean;
import com.web.entity.TheaterBean;
import com.web.entity.TimeTableBean;
import com.web.service.TheaterService;

@Transactional
@Service
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	TheaterDao tdao;
	@Autowired
	SeatDao sdao;

	final static String SEAT_TAG_EMPTY = "<td></td>";
	/**
	 * Replace "<b>#ROWCOL</b>" before use it.
	 */
	final static String SEAT_TAG_AVAILABLE = "<td title='#ROWCOL'><label for='seat#ROWCOL'></label><input type='checkbox'name='seat'id='seat#ROWCOL'value='#ROWCOL'></td>";
	/**
	 * Replace "<b>#ROWCOL</b>" & "<b>#OPTION</b>" before use it.
	 */
	final static String SEAT_TAG_OPTION = "<td title='#ROWCOL'><label for='seat#ROWCOL'class='#OPTION'></label><input class='#OPTION notSale'type='checkbox'name='seat'id='seat#ROWCOL'value='#ROWCOL'></td>";
	// final static String PRESERVE_SEAT_TAG = "";
	/**
	 * Replace "<b>#ROW</b>" before use it.
	 */
	final static String SPACE_ROW = "<tr><td><label class='invisible' for='space#ROW'></label><input type='checkbox' id='space#ROW' name='seat' value='space'></td></tr>\n";
	final static String OPTION_SOLD = "sold";
	final static String OPTION_PRESERVE = "preserve";

	@Override
	public int save(TheaterBean tb) {
		return tdao.save(tb);
	}

	@Override
	public int update(TheaterBean tb) {
		return tdao.update(tb);
	}

	@Override
	public int delete(TheaterBean tb) {
		return tdao.delete(tb);
	}

	@Override
	public TheaterBean getTheater(String theater) {
		return tdao.getTheater(theater);
	}

	@Override
	public TheaterBean getTheaterByNo(Integer no) {
		return tdao.getTheaterByNo(no);
	}

	@Override
	public List<SeatBean> getSeatsByTimeTable(Integer timeTableNo) {
		return sdao.getSeatsByTimeTable(timeTableNo);
	}

	@Override
	public String getTheaterStatus(String theater, Integer timeTableId) {
		TheaterBean tb = tdao.getTheater(theater);
		Map<String, String> notAvailableSeats = seatListToMap(getSeatsByTimeTable(timeTableId));
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split("=");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}

		return getSeatTable(tb, notAvailableSeats);
	}
	@Override
	public String getTheaterStatus(TimeTableBean time) {
		TheaterBean tb = tdao.getTheater(time.getTheater());
		Map<String, String> notAvailableSeats = seatListToMap(getSeatsByTimeTable(time.getNo()));
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split("=");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}
		
		return getSeatTable(tb, notAvailableSeats);
	}
	@Override
	public String getTheaterStatus(TheaterBean tb, Integer timeTableId) {
		Map<String, String> notAvailableSeats = seatListToMap(getSeatsByTimeTable(timeTableId));
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split("=");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}
		
		return getSeatTable(tb, notAvailableSeats);
	}
	@Override
	public String getTheaterStatus(TheaterBean tb, TimeTableBean time) {
		Map<String, String> notAvailableSeats = seatListToMap(getSeatsByTimeTable(time.getNo()));
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split("=");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}
		
		return getSeatTable(tb, notAvailableSeats);
	}
	
	@Override
	public String getTheaterStatus(String theater) {
		TheaterBean tb = tdao.getTheater(theater);
		Map<String, String> notAvailableSeats = new HashMap<>();
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split(",");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}		
		return getSeatTable(tb, notAvailableSeats);
	}
	@Override
	public String getTheaterStatus(TheaterBean tb) {
		Map<String, String> notAvailableSeats = new HashMap<>();
		for (String seat : tb.getOptionSeat()) {
			String[] seatStatus = seat.split(",");
			notAvailableSeats.put(seatStatus[0], seatStatus[1]);
		}		
		return getSeatTable(tb, notAvailableSeats);
	}

	private Map<String, String> seatListToMap(List<SeatBean> list) {
		Map<String, String> result = new HashMap<>();
		if (list != null && !list.isEmpty()) {
			for (SeatBean seat : list) {
				String rowCol = seat.getSeatString();
				result.put(rowCol, "sold");
			}
		}
		return result;
	}

	private String getSeatTable(TheaterBean tb, Map<String, String> notAvailableSeats) {
		StringBuilder s = new StringBuilder(65536);
		Integer[] spaceRow = tb.getSpaceRow();
		Integer[] pattern = tb.getPattern();
		System.out.println("zone = " + tb.getZone());
		System.out.println(Arrays.toString(pattern));
		int spaceRowCnt = 0;
		char row = 'A';
		for (int i = 0; i < tb.getRowCnt(); i++) {
			s.append("<tr><td>" + row + "</td><td></td>"); // a row start
			generateRow(s, row, pattern, tb, notAvailableSeats);
			s.append("<td></td><td></td><td>" + row + "</td></tr>\n");// a row done

			if (spaceRow.length - 1 >= spaceRowCnt && row - 'A' + 1 == spaceRow[spaceRowCnt]) {
				s.append(SPACE_ROW.replace("#ROW", String.valueOf(row)));
				spaceRowCnt++;
			}
			row++;
		}
		return s.toString();
	}

	private void generateRow(StringBuilder s, char row, Integer[] pattern, TheaterBean tb,
			Map<String, String> notAvailableSeats) {

		int col = 1;
		for (int zoneCnt : pattern) {
			s.append(SEAT_TAG_EMPTY);
			if (notAvailableSeats == null || notAvailableSeats.isEmpty()) {
				for (int i = 0; i < zoneCnt; i++, col++) {
					String rowCol = row + String.valueOf(col);
					s.append(SEAT_TAG_AVAILABLE.replace("#ROWCOL", rowCol));
				}
			} else {

				for (int i = 0; i < zoneCnt; i++, col++) {
					String rowCol = row + String.valueOf(col);
					String option = notAvailableSeats.get(rowCol);
					if (option == null) {
						s.append(SEAT_TAG_AVAILABLE.replace("#ROWCOL", rowCol));
					} else {
						switch (option) {
						case "sold":
							s.append(SEAT_TAG_OPTION.replace("#ROWCOL", rowCol).replace("#OPTION", OPTION_SOLD));
							break;
						case TheaterBean.PRESERVE_SEAT:
							s.append(SEAT_TAG_OPTION.replace("#ROWCOL", rowCol).replace("#OPTION", OPTION_PRESERVE));
							break;
						case TheaterBean.NULL_SEAT:
							s.append(SEAT_TAG_EMPTY);
							break;
						default:
							s.append(SEAT_TAG_AVAILABLE.replace("#ROWCOL", rowCol));
							break;
						}
					}
				}
			}
		}
		return;
	}
}
