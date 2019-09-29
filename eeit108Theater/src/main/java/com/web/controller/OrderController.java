package com.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping("/allPro") // test for all products
	public String showAllProduct(Model model) {
		model.addAttribute("products", pServ.getAll());
		return pac + "allProducts";
	}

	// 已經接上時刻表
//	@RequestMapping({ "", "/" }) // 未來交給時刻表提供相關訊息
//	public String orderBegin(Model model, HttpSession session, HttpServletRequest req) {
//
//		System.err.println("====orderBegin Start====");
////		MemberBean mb = pServ.getMemberByNo(1);
//		System.out.println("====MemberBean Got");
//		session.removeAttribute("order");
////		session.setAttribute("LoginOK", mb);
//		System.err.println("====orderBegin END====");
//		return pac + "start";
//	}

	/*
	 * 建立一筆order於httpSession，並將所選擇的時刻表塞入order中。 自資料庫取得商品清單，並在前台顯示 ，供使用者選擇
	 */
	@RequestMapping("/showProducts")
	public String showProductByType(Model model, HttpSession session, HttpServletRequest req) {
		System.err.println("====showProductByType Start====");
		String tid = req.getParameter("time");
		if (tid == null || tid.trim().equals("")) {
			System.err.println("Lack of Time Table Id");
			throw new NullPointerException("Lack of Time Table Id");
			// Exception due to lack of time table id.
		}
		OrderBean ob = (OrderBean) session.getAttribute("order");
		if (ob == null || !ob.getTimeTable().getNo().equals(Integer.valueOf(tid))) { // if user not from seat
			if (ob == null)
				System.out.println("its null order");
			else {
				System.out.println(ob.getTimeTable().getNo() + " vs " + Integer.valueOf(tid));

			}
			System.out.println("set an new order");
			ob = new OrderBean(true);
			ob.setTimeTable(pServ.getTimeTableByNo(Integer.valueOf(tid)));
			session.setAttribute("order", ob);
		}
		model.addAttribute("foods", pServ.getProductsByType("food"));
		model.addAttribute("drinks", pServ.getProductsByType("drink"));
		model.addAttribute("tickets", pServ.getTicketsByVersion(ob.getTimeTable().getVersion()));
		System.err.println("====showProductByType END====");
		return pac + "productsByType";
	}

	/*
	 * 針對使用者每次選擇的商品種類及數量，做訂單中購物清單的即時更新。 直接更新Order中的OrderItems內容以及totalPrice
	 */
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====orderList begin====");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		List<OrderItemBean> orderList = ob.getOrderItems();
		Map<String, OrderItemBean> itemsMap = new HashMap<>();
		ob.setItemsMap(itemsMap);
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
		for (OrderItemBean oib : orderList) {
			itemsMap.put(oib.getItemName(), oib);
		}
		ob.calTotalPrice();
		ob.setTicketCnt(Integer.parseInt(req.getParameter("ticketCnt")));
		System.out.println(ob.getOrderItemString());
		System.out.println(orderList);
		System.err.println("====orderList END====");
		return pac + "orderList";
	}

	/*
	 * 依據order中的timeTable資訊，去向資料庫取得現在選擇之場次之座位現況。 依據order中的timeTable資訊，產生對應的影廳座位表。
	 * 
	 */
	@RequestMapping("/seat")
	public String showSeat(Model model, HttpSession session) {
		System.err.println("====showSeat Start====");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		if (ob.getTicketCnt() == null || ob.getTicketCnt() == 0) { // 禁止透過改前頁網址的方式執行此方法
			return "forward:/" + pac + "showProducts?time=" + ob.getTimeTable().getNo();
		}
		System.out.println(ob.getOrderItemString());
		List<SeatBean> seatList = pServ.getSeatsByTimeTable(ob.getTimeTable().getNo());
		Map<String, Boolean> soldSeats = new HashMap<>();
		if (seatList != null && !seatList.isEmpty()) {
			for (SeatBean seat : seatList) {
				String rowCol = seat.getSeatString();
				soldSeats.put(rowCol, true);
			}
		}

		int rowCnt = 15;
		int aZoneCnt = 5;
		int bZoneCnt = 15;
		int zoneNum = 2;
//		int rowCnt = Integer.valueOf(req.getParameter("rowCnt"));
//		int aZoneCnt = Integer.valueOf(req.getParameter("aZoneCnt"));
//		int bZoneCnt = Integer.valueOf(req.getParameter("bZoneCnt"));
//		int zoneNum = Integer.valueOf(req.getParameter("zoneNum"));
		String s = this.getSeatTable(rowCnt, aZoneCnt, bZoneCnt, zoneNum, soldSeats);
		model.addAttribute("seatTable", s);
		System.out.println(s);
		System.err.println("====showSeat END====");
		return pac + "seat";
	}

	@RequestMapping("/makeOrder")
	public String showOrder(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====showOrder Start====");

		String[] seats = req.getParameterValues("seat");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		ob.sortOrderItem("ticket", "drink");
		ob.calTotalPrice();
		// to set the chosen seats into order; if return value = -1, the
		// chosen seats has been ordered already
		System.out.println(seats);
		if (oServ.setSeatToOrder(ob, seats) == -1) {
			System.err.println("=== Selected seats has been sold already ===");
			req.setAttribute("seatSoldErr", "很抱歉，您所選擇的座位稍早已售出，請重新選擇座位。");
			System.err.println("====showOrder FORWARD TO showSeat====");
			return "forward:/" + pac + "seat";
		}
		System.out.println("set seats success");
		model.addAttribute("orderItems", ob.getOrderItems());
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
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
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
		// generate tradeNo a.k.a orderId
		int obHash = ob.hashCode();
		char fst = (char) ('A' + (ts.getTime() % 26));
		char sec = (char) ('A' + (-obHash % 13));
		if (obHash > 0) {
			sec = (char) ('N' + (obHash % 13));
		}
		String tradeNo = String.valueOf(fst) + String.valueOf(sec) + Math.abs(obHash);
		ob.setOrderId(tradeNo);

		String base = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath(); // http:localhost:XXXX/eeit108Theater
		// EcPay Begin
		// EcPay對各項method都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime(); // 指定付款方式為信用卡一次付清
		obj.setMerchantTradeNo(tradeNo); // 設定訂單編號
		obj.setMerchantTradeDate(sdf.format(ts)); // 設定交易日期
		obj.setTotalAmount(String.valueOf(ob.getTotalPrice().intValue())); // 設定總付款金額
		obj.setTradeDesc("716 Theater Order");
		obj.setItemName(ob.getOrderItemString()); // 設定顯示在EcPay頁面的購物清單
		obj.setReturnURL(base + "/order/receive");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL(base + "/order/result"); // EcPay會在付款結束後，將USER
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

	@RequestMapping("/receive") // this method may not be called, because, so far, the server is localhost
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

	@RequestMapping("/search")
	public String orderDetail(HttpServletRequest req, Model model, HttpSession session) {
		System.err.println("=====OrderDetail Start=====");
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) { // 非會員
			System.out.println("hasn't login");
			System.err.println("=====OrderDetail Forward To guestCheck=====");
			return pac + "guestCheck";
		}
		List<OrderBean> checkedOrders = null;
		List<OrderBean> uncheckedOrders = null;
		String memberId = mb.getMemberId();
		checkedOrders = oServ.getMemberOrders(memberId, true);
		uncheckedOrders = oServ.getMemberOrders(memberId, false);

		if (checkedOrders == null || checkedOrders.isEmpty()) {
			System.out.println("no checked orders");
		} else {
			model.addAttribute("checkedOrders", checkedOrders);
		}
		if (uncheckedOrders == null || uncheckedOrders.isEmpty()) {
			System.out.println("no unchecked orders");
		} else {
			model.addAttribute("uncheckedOrders", uncheckedOrders);
		}

		System.err.println("=====OrderDetail End=====");
		return pac + "memberDetail";
	}

	@RequestMapping(value = "/guest", method = RequestMethod.POST)
	public String guestSearch(HttpServletRequest req, Model model) {
		System.err.println("=====GuestSearch start=====");
		String email = req.getParameter("email").trim();
		String phone = req.getParameter("phone").trim();
		System.out.println(email);
		System.out.println(phone);
		Map<String, String> errMsg = new HashMap<>();
		if (email == null || email.equals("")) {
			errMsg.put("email", "該欄不能空白");
		} else {
			if (email.indexOf("@") == -1 || email.indexOf(".") == -1)
				errMsg.put("email", "Email格式不正確");
		}
		if (phone == null || phone.equals("")) {
			errMsg.put("phone", "該欄不能空白");
		} else {
			if (!phone.matches("[0-9]{10}")) {
				errMsg.put("phone", "電話格式不正確");
			}
		}
		if (!errMsg.isEmpty()) {
			model.addAttribute("errMsg", errMsg);
			return pac + "guestCheck";
		}
		List<OrderBean> list = oServ.getGuestOrders(email, phone, false);
		if (list != null && !list.isEmpty())
			model.addAttribute("uncheckedOrders", list);
		System.err.println("=====GuestSearch END=====");
		return pac + "guestDetail";
	}

	private String getSeatTable(int rowCnt, int aZoneCnt, int bZoneCnt, int zoneNum, Map<String, Boolean> soldSeats) {
		StringBuilder s = new StringBuilder(65536);
		char row = 'A';
		for (int i = 0; i < rowCnt; i++) {
			s.append("<tr><td>" + row + "</td><td></td><td></td>");
			int colNow = 1;
			colNow = generateZone(s, row, colNow, aZoneCnt, soldSeats);
			s.append("<td></td>");
			colNow = generateZone(s, row, colNow, bZoneCnt, soldSeats);
			if (zoneNum == 3) {
				s.append("<td></td>");
				colNow = generateZone(s, row, colNow, aZoneCnt, soldSeats);
			}
			s.append("<td></td><td></td><td>" + row + "</td></tr>");
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

	private int generateZone(StringBuilder s, char row, int colNow, int zoneCnt, Map<String, Boolean> soldSeats) {
		if (soldSeats.isEmpty()) {
			for (int col = 0; col < zoneCnt; col++, colNow++) {
				String rowCol = row + String.valueOf(colNow);
				s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
						+ "\"></label><input type=\"checkbox\"name=\"seat\"id=\"seat" + rowCol + "\"value=\"" + rowCol
						+ "\"></td>");
			}
		} else {
			for (int col = 0; col < zoneCnt; col++, colNow++) {
				String rowCol = row + String.valueOf(colNow);
				if (!soldSeats.containsKey(rowCol)) {
					s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
							+ "\"></label><input type=\"checkbox\"name=\"seat\"id=\"seat" + rowCol + "\"value=\""
							+ rowCol + "\"></td>");
				} else {
					s.append("<td><label for=\"seat" + rowCol + "\"title=\"" + rowCol
							+ "\"class=\"sold-label\"></label><input class=\"sold\"type=\"checkbox\"name=\"seat\"id=\"seat"
							+ rowCol + "\"value=\"" + rowCol + "\"></td>");
				}
			}
		}

		return colNow;
	}
}
