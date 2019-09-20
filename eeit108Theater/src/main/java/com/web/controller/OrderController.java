package com.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.MemberBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.SeatBean;
import com.web.service.MovieService;
import com.web.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ProductService pServ;
	@Autowired
	MovieService mServ;

	String pac = "order/";
	
	@RequestMapping("/allProducts")
	public String showAllProduct(Model model) {
		model.addAttribute("products", pServ.getAll());
		return pac + "allProducts";
	}

	@RequestMapping({ "", "/" }) // 未來交給時刻表提供相關訊息
	public String orderBegin(Model model, HttpSession session, HttpServletRequest req) {

		System.out.println("====orderBegin Start");

		System.out.println("====TimeTableBean Got");
		MemberBean mb = pServ.getMemberByNo(1);
		System.out.println("====MemberBean Got");

		session.setAttribute("loginMember", mb);
		return pac + "start";
	}

	@RequestMapping("/showProducts")
	public String showProductByType(Model model, HttpSession session, HttpServletRequest req) {
		OrderBean ob = (OrderBean) session.getAttribute("order");
		if(ob == null) {			
			ob = new OrderBean(true);
			ob.setTimeTable(pServ.getTimeTableByNo(Integer.valueOf(req.getParameter("timeTableId"))));
			MemberBean mb = (MemberBean) session.getAttribute("loginMember");
			if (mb != null) {
				ob.setOwnerEmail(mb.getEmail());
				ob.setOwnerId(mb.getMemberId());
				ob.setOwnerName(mb.getName());
			}
			session.setAttribute("order", ob);
		}
		model.addAttribute("foods", pServ.getProductsByType("food"));
		model.addAttribute("drinks", pServ.getProductsByType("drink"));
		model.addAttribute("tickets", pServ.getTicketsByVersion(ob.getTimeTable().getVersion()));
		return pac + "productsByType";
	}

	@RequestMapping("/orderList")
	public String orderList(Model model, HttpServletRequest req, HttpSession session) {
		System.out.println("====orderList begin");
		List<OrderItemBean> orderList = ((OrderBean) session.getAttribute("order")).getOrderItems();
		System.out.println("orderList size = " + orderList.size());
		String name = req.getParameter("name");
		Integer quantity = Integer.valueOf(req.getParameter("quantity"));
		boolean exist = false;
		int index = 0;
		for (int i = 0; i < orderList.size(); i++) {
			if (orderList.get(i).getItemName().equals(name)) {
				exist = true;
				index = i;
				break;
			}
		}
		if (exist) {
			if (quantity == 0)
				orderList.remove(index);
			else
				orderList.get(index).setQuantity(quantity);
		} else {
			OrderItemBean oib = new OrderItemBean(pServ.getProductByName(name));
			oib.setQuantity(quantity);
			oib.setSumPrice(oib.getUnitPrice() * oib.getQuantity());
			orderList.add(oib);
		}
		System.out.println(orderList);
		System.out.println("====orderList end");
		return pac + "orderList";
	}

	@RequestMapping("/makeOrder")
	public String showOrder(Model model, HttpServletRequest req, HttpSession session) {
		OrderBean ob = (OrderBean) session.getAttribute("order");
		Set<OrderItemBean> set = new HashSet<>();
		// ob.setOrderItems(set);
		ob.setTotalPrice(0.0);

		System.out.println("======showOrder");
		List<OrderItemBean> list = new ArrayList<>();
		Map<String, String[]> readOnly = req.getParameterMap();
		if (readOnly == null)
			System.out.println("=======Map is null");
		else {
			System.out.println("=====beginFor");
			for (String key : req.getParameterMap().keySet()) {
				if(key.equals("ticketCnt")) continue;
				if (readOnly.get(key)[0] == null || readOnly.get(key)[0].equals("") || readOnly.get(key)[0].equals("0"))
					System.out.println("====key" + key + " is NULL");
				else {
					System.err.println("====key" + key + " is NOT NULL");
					
					OrderItemBean oib = new OrderItemBean();
					oib.setAvailable(true);
					oib.setItemName(key);
					Integer unit = Integer.valueOf(readOnly.get(key)[0]);
					oib.setQuantity(unit == null ? 0 : unit);
					oib.setUnitPrice(pServ.getProductByName(key).getPrice());
					oib.setSumPrice(oib.getQuantity() * oib.getUnitPrice());
					ob.setTotalPrice(ob.getTotalPrice() + oib.getSumPrice());
					list.add(oib);
					set.add(oib);
				}
			}
			System.out.println("=====endFor");
		}
		
		model.addAttribute("orderItems", list);
		// model.addAttribute("order", ob);
		System.out.println("======RETURN showOrder");
		//session.setAttribute("order", ob);
		session.setAttribute("ticketCnt", req.getParameter("ticketCnt"));
		return pac + "orderItems";
	}

	@RequestMapping("/seat")
	public String showSeatPage(Model model, HttpSession session, HttpServletRequest req) {
		System.out.println("controller method => SEAT");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		List<SeatBean> seatList = pServ.getSeatsByTimeTable(ob.getTimeTable().getNo());
		Map<String, Boolean> seatEmpty = new HashMap<>();
		for (SeatBean seat : seatList) {
			String rowCol = seat.getRow() + seat.getColumn();
			seatEmpty.put(rowCol, seat.getOrderId() == null ? true : false);
		}
		int rowCnt = Integer.valueOf(req.getParameter("rowCnt"));
		int aZoneCnt = Integer.valueOf(req.getParameter("aZoneCnt"));
		int bZoneCnt = Integer.valueOf(req.getParameter("bZoneCnt"));
		int zoneNum = Integer.valueOf(req.getParameter("zoneNum"));
		model.addAttribute("sideBar", this.getSideBar(rowCnt));
		String s = this.getSeatTable(rowCnt, aZoneCnt, bZoneCnt, zoneNum, seatEmpty);
		model.addAttribute("seatTable", s);
		System.out.println(s);
		System.out.println("controller method => SEAT  END");
		return pac + "seat";
	}

	private String getSideBar(int rowCnt) {
		StringBuilder s = new StringBuilder(512);
		char row = 'A';
		for (int i = 0; i < rowCnt; i++) {
			s.append("<tr><td>" + (char) (row + i) + "</td></tr>");
			if (rowCnt >= 12 && i == rowCnt / 2 - 2) {
				s.append(
						"<tr><td><label class=\"invisible\"for=\"bar-space\"></label><input type=\"checkbox\"name=\"seat\"id=\"bar-space\"value=\"space\"></td></tr>");
			}
		}
		return s.toString();
	}

	private String getSeatTable(int rowCnt, int aZoneCnt, int bZoneCnt, int zoneNum, Map<String, Boolean> seatEmpty) {
		StringBuilder s = new StringBuilder(65536);
		char row = 'A';
		for (int i = 0; i < rowCnt; i++) {
			s.append("<tr><td></td><td></td><td></td>");
			int colNow = 1;
			colNow = generateZone(s, row, colNow, aZoneCnt, seatEmpty);
			s.append("<td></td>");
			colNow = generateZone(s, row, colNow, bZoneCnt, seatEmpty);
			if (zoneNum == 3) {
				s.append("<td></td>");
				colNow = generateZone(s, row, colNow, aZoneCnt, seatEmpty);
			}
			s.append("<td></td><td></td><td></td></tr>");
			s.append("\n");
			row++;
			if (rowCnt >= 12 && i == rowCnt / 2 - 2) {
				s.append(
						"<tr><td><label class=\"invisible\"for=\"space\"></label><input type=\"checkbox\"name=\"seat\"id=\"space\"value=\"space\"></td></tr>");
			}
		}
		System.out.println("builder's length = " + s.length());
		return s.toString();
	}

	private int generateZone(StringBuilder s, char row, int colNow, int zoneCnt, Map<String, Boolean> seatEmpty) {
		for (int col = 0; col < zoneCnt; col++, colNow++) {
			String rowCol = row + String.valueOf(colNow);
			System.out.println("======row-col = " + rowCol);
			if (seatEmpty.get(rowCol)) {
				s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
						+ "\"></label><input type=\"checkbox\"name=\"seat\"id=\"seat" + rowCol + "\"value=\"" + rowCol
						+ "\"></td>");
			} else {
				s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
						+ "\"class=\"sold\"></label><input type=\"checkbox\"name=\"seat\"id=\"seat" + rowCol
						+ "\"value=\"" + rowCol + "\"></td>");
			}
		}
		return colNow;
	}
}
