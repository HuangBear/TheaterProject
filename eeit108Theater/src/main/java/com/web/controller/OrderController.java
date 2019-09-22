package com.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.MemberBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.SeatBean;
import com.web.service.MovieService;
import com.web.service.OrderService;
import com.web.service.ProductService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ProductService pServ;
	@Autowired
	MovieService mServ;
	@Autowired
	OrderService oServ;

	final String pac = "order/";

	@RequestMapping("/allProducts")
	public String showAllProduct(Model model) {
		model.addAttribute("products", pServ.getAll());
		return pac + "allProducts";
	}

	@RequestMapping({ "", "/" }) // 未來交給時刻表提供相關訊息
	public String orderBegin(Model model, HttpSession session, HttpServletRequest req) {

		System.err.println("====orderBegin Start====");

		System.out.println("====TimeTableBean Got");
		MemberBean mb = pServ.getMemberByNo(1);
		System.out.println("====MemberBean Got");
		session.removeAttribute("order");
		session.setAttribute("loginMember", mb);
		System.err.println("====orderBegin END====");
		return pac + "start";
	}

	@RequestMapping("/showProducts")
	public String showProductByType(Model model, HttpSession session, HttpServletRequest req) {
		System.err.println("====showProductByType Start====");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		if (ob == null) {
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
		System.err.println("====showProductByType END====");
		return pac + "productsByType";
	}

	@RequestMapping("/orderList")
	public String orderList(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====orderList begin====");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		List<OrderItemBean> orderList = ob.getOrderItems();
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
			else {
				orderList.get(index).setQuantity(quantity);
				orderList.get(index).calSumPrice();
			}
		} else {
			OrderItemBean oib = new OrderItemBean(pServ.getProductByName(name));
			oib.setQuantity(quantity);
			oib.calSumPrice();
			orderList.add(oib);
		}
		ob.calTotalPrice();
		System.out.println(orderList);
		System.err.println("====orderList END====");
		return pac + "orderList";
	}

	@RequestMapping("/seat")
	public String showSeatPage(Model model, HttpSession session, HttpServletRequest req) {
		System.err.println("====seat Start====");
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
		model.addAttribute("ticketCnt", req.getParameter("ticketCnt"));
		System.out.println(s);
		System.err.println("====seat END====");
		return pac + "seat";
	}

	@RequestMapping("/makeOrder")
	public String showOrder(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====showOrder Start====");
		String[] seats = req.getParameterValues("seat");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		ob.sortOrderItem("ticket", "drink");
		System.out.println(ob.getOrderItemString());
		oServ.setSeatToOrder(ob, seats);
		ob.calTotalPrice();
		model.addAttribute("orderItems", ob.getOrderItems());
		model.addAttribute("seats", seats);
		session.setAttribute("ticketCnt", req.getParameter("ticketCnt"));

		System.err.println("====showOrder END====");
		return pac + "orderItems";
	}

	@RequestMapping(value = "/pay")
	public String payByEcPay(HttpSession session, @RequestParam Integer idType, Model model, HttpServletRequest req) {
		System.out.println("type = " + idType);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		if (idType == 0) { // pay as member
			MemberBean mb = (MemberBean) session.getAttribute("loginMember");
			ob.setOwnerId(mb.getMemberId());
			ob.setOwnerName(req.getParameter("memberName"));
			ob.setOwnerEmail(req.getParameter("memberEmail"));
			ob.setOwnerPhone(req.getParameter("memberPhone"));
		} else { // pay as guest
			ob.setOwnerId("GUEST");
			ob.setOwnerName(req.getParameter("guestName"));
			ob.setOwnerEmail(req.getParameter("guestEmail"));
			ob.setOwnerPhone(req.getParameter("guestPhone"));
		}
		ob.setOrderTime(ts);
		int obHash = ob.hashCode();
		char fst = (char) ('A' + (ts.getTime() % 26));
		char sec = (char) ('A' + (-obHash % 13));
		if (obHash > 0) {
			sec = (char) ('N' + (obHash % 13));
		}
		String tradeNo = String.valueOf(fst) + String.valueOf(sec) + Math.abs(obHash);
		ob.setOrderId(tradeNo);

		// EcPay Begin
		// EcPay對各項method都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime(); // 指定付款方式為信用卡一次付清

		obj.setMerchantTradeNo(tradeNo); // 設定訂單編號
		obj.setMerchantTradeDate(sdf.format(ts)); // 設定交易日期
		obj.setTotalAmount(String.valueOf(ob.getTotalPrice().intValue())); // 設定總付款金額
		obj.setTradeDesc("716 Theater Order");
		obj.setItemName(ob.getOrderItemString()); // 設定顯示在EcPay頁面的購物清單
		obj.setReturnURL("http://localhost:8080/eeit108Theater/order/receive");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL("http://localhost:8080/eeit108Theater/order/result"); // EcPay會在付款結束後，將USER
																					// redirect至此，並附帶交易結果相關資訊
		obj.setNeedExtraPaidInfo("N"); // Y/N = True/False
		obj.setRedeem("N"); // 紅利 Y/N = True/False

		String form = all.aioCheckOut(obj, null); // null for no invoice
		// all.aioCheckOut會根據前面設定好的參數產生一個html表格的字串，
		// 裡面的各種input都已經設定好了，並且會自動submit，
		// 只要將這個字串加為attribute並且顯示在回傳頁面上，便會自動執行，並跳轉到EcPay付款頁面。
		// EcPay End
		System.out.println("form =\n" + form);
		model.addAttribute("ecpayForm", form);
		return pac + "ecpay";
	}

	@RequestMapping("/receive")
	public String receive(HttpServletRequest req) {
		System.err.println("=====GOT FROM ECPAY=====");
		Map<String, String[]> map = req.getParameterMap();
		if (map == null || map.size() == 0) {
			System.out.println("receive map is empty");
			return pac + "receive";
		}
		Set<String> keySet = map.keySet();
		for (String key : keySet) {
			System.out.println(map.get(key));
		}
		System.err.println("=====Receive END=====");
		return pac + "receive";
	}

	@RequestMapping("/result")
	public String result(HttpServletRequest req, Model model, HttpSession session) {
		System.err.println("=====CLIENT BACK From EcPay=====");
		Map<String, String[]> map = req.getParameterMap();

		if (map == null || map.size() == 0) { // if the parameter map is null or empty -> Fail to get any information
												// from EcPay
			System.out.println("result map is empty");
			model.addAttribute("rtnMsg", new String[] { "Result Map is Empty" });
			System.err.println("!!=====Result Fail=====!!");
			return pac + "fail";
		}
		Set<String> keySet = map.keySet(); // to show all of parameter sent by EcPay on console
		for (String key : keySet) {
			System.out.println("==key:" + key + "===");
			for (String s : map.get(key)) {
				System.out.println(s);
			}
		}

		// to accomplish the order
		OrderBean ob = (OrderBean) session.getAttribute("order");
		if (ob == null) {
			model.addAttribute("rtnMsg", new String[] { "OOOOOOOOPS, ORDER IS GONE!!!" });
			System.err.println("!!=====Result Fail=====!!");
			return pac + "fail";
		}

		String returnCode = map.get("RtnCode")[0].trim();
		if (!returnCode.equals("1")) { // if RtnCode != 1 -> the trade failed.
			System.out.println("RtnCode =" + returnCode);
			model.addAttribute("rtnMsg", map.get("RtnMsg"));
			ob.setSeats(null);
			oServ.saveOrder(ob);
			System.err.println("!!=====Result Fail=====!!");
			return pac + "fail";
		}

		ob.setPaid(true);
		oServ.saveOrder(ob);
		System.err.println("=====Result END=====");
		return pac + "result";
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
			if (seatEmpty.get(rowCol)) {
				s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
						+ "\"></label><input type=\"checkbox\"name=\"seat\"id=\"seat" + rowCol + "\"value=\"" + rowCol
						+ "\"></td>");
			} else {
				s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
						+ "\"class=\"sold-label\"></label><input class=\"sold\"type=\"checkbox\"name=\"seat\"id=\"seat"
						+ rowCol + "\"value=\"" + rowCol + "\"></td>");
			}
		}
		return colNow;
	}
}
