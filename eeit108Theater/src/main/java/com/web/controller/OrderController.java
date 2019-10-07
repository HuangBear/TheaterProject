package com.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.entity.BulletinBean;
import com.web.entity.MemberBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.TheaterBean;
import com.web.entity.TimeTableBean;
import com.web.service.BulletinService;
import com.web.service.EmailService;
import com.web.service.MovieService;
import com.web.service.OrderService;
import com.web.service.ProductService;
import com.web.service.TheaterService;
import com.web.service.TimeTableService;

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
	@Autowired
	BulletinService bServ;
	@Autowired
	EmailService emailServ;
	@Autowired
	TheaterService tServ;
	@Autowired
	ServletContext context;
	@Autowired
	TimeTableService timeServ;

	final String pac = "order/";

	@RequestMapping("/allPro") // test for all products
	public String showAllProduct(Model model) {
		model.addAttribute("products", pServ.getAll());
		return pac + "allProducts";
	}

	@RequestMapping("/theaterTest")
	public String testTheater(Model model) {
		String theater = tServ.getTheaterStatus("A廳", 869);
		System.out.println(theater);
		model.addAttribute("theater", theater);
		return pac + "theaterTest";
	}

	/**
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

			ob.setTimeTable(timeServ.getTimeTableByNo(Integer.valueOf(tid)));
			session.setAttribute("order", ob);
		}
		model.addAttribute("foods", pServ.getProductsByType("food", true));
		model.addAttribute("drinks", pServ.getProductsByType("drink", true));
		model.addAttribute("tickets", pServ.getTicketsByVersion(ob.getTimeTable().getVersion()));
		String timeTableDate = ob.getTimeTable().getStartDate();
		System.out.println("start date = " + timeTableDate);

		List<BulletinBean> discounts = bServ.getDiscount(timeTableDate);
		if (discounts.isEmpty())
			System.out.println("there is no available discounts");
		else {
			System.out.println("there are " + discounts.size() + " discounts");
			session.setAttribute("discounts", discounts);
		}
		System.err.println("====showProductByType END====");
		return pac + "productsByType";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/calDiscount")
	public String calDiscount(@RequestParam("chosenDiscount") Integer discountId, HttpSession session) {
		System.out.println("cal discount begin : discountId = " + discountId);
		List<BulletinBean> discounts = (List<BulletinBean>) session.getAttribute("discounts");
		if (discountId == 0) {
			session.removeAttribute("chosenDiscount");
		} else {
			BulletinBean b = null;
			for (BulletinBean bb : discounts) {
				if (bb.getNo() == discountId) {
					b = bb;
					break;
				}
			}
			if (b == null)
				throw new NullPointerException("Illegal discount selected");
			session.setAttribute("chosenDiscount", b);
		}
		return "forward:/" + pac + "orderList";
	}

	/**
	 * 針對使用者每次選擇的商品種類及數量，做訂單中購物清單的即時更新。 直接更新Order中的OrderItems內容以及totalPrice
	 */
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====orderList begin====");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		List<OrderItemBean> orderList = ob.getOrderItems();
		Map<String, OrderItemBean> itemsMap = new HashMap<>();
		ob.setItemsMap(itemsMap);
		String name = req.getParameter("name");
		if (name != null) { // to update orderItem status
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
			ob.setTicketCnt(Integer.parseInt(req.getParameter("ticketCnt")));
		}
		List<Double> ticketPrice = new ArrayList<>();
		Integer discountIndex = null;
		for (int i = 0; i < orderList.size(); i++) {
			OrderItemBean oib = orderList.get(i);
			if (oib.getType().equals("discount")) {
				discountIndex = i;
			}
			if (oib.getType().equals("ticket")) {
				for (int j = 0; j < oib.getQuantity(); j++) {
					ticketPrice.add(oib.getUnitPrice());
				}
			}
			itemsMap.put(oib.getItemName(), oib);
		}
		if (discountIndex != null)
			orderList.remove((int) discountIndex);
		Collections.sort(ticketPrice);
		System.out.println("ticketCnt = " + ob.getTicketCnt() + ", ticketPrice.size = " + ticketPrice.size());
		ob.calTotalPrice();

		BulletinBean b = (BulletinBean) session.getAttribute("chosenDiscount");
		if (b != null) {
			OrderItemBean discountItem = new OrderItemBean();
			discountItem.setType("discount");
			discountItem.setAvailable(false);
			discountItem.setQuantity(1);
			if (b.getDiscountPriceBuy() != null) { // 滿X送Y
				discountItem.setUnitPrice(
						(double) -(((int) (ob.getTotalPrice() / b.getDiscountPriceBuy())) * b.getDiscountPriceFree()));
				discountItem.setItemName(b.getPay() + b.getDiscountPriceBuy() + b.getFree() + b.getDiscountPriceFree());
			} else if (b.getDiscountTickBuy() != null) { // 買X送Y
				int free = 0;
				int times = (ticketPrice.size() / (b.getDiscountTickBuy() + b.getDiscountTickFree()))
						* b.getDiscountTickFree();
				for (int i = 0; i < times; i++) {
					free += ticketPrice.get(i);
				}
				discountItem.setUnitPrice((double) -free);
				discountItem.setItemName(b.getPay() + b.getDiscountTickBuy() + b.getFree() + b.getDiscountTickFree());
			}
			discountItem.calSumPrice();
			orderList.add(discountItem);
			System.out.println(discountItem.getDetail());
			System.out.println(discountItem.getPriceDetail());
		}
		ob.calTotalPrice();
		System.out.println(ob.getOrderItemString());
		System.out.println(orderList);
		System.err.println("====orderList END====");
		return pac + "orderList";
	}

	/**
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
		ob.sortOrderItem("ticket", "drink");
		System.out.println(ob.getOrderItemString());
		TheaterBean tb = tServ.getTheater(ob.getTimeTable().getTheater());
		int minWidth = tb.getTheaterWidth();
		String s = tServ.getTheaterStatus(tb, ob.getTimeTable().getNo());
		model.addAttribute("seatTable", s);
		model.addAttribute("minWidth", minWidth);
		System.out.println(s);
		System.err.println("====showSeat END====");
		return pac + "seat";
	}

	@RequestMapping("/peekSeat")
	public String peekSeat(Model model, @RequestParam("time") Integer time) {
		TimeTableBean timeTable = timeServ.getTimeTableByNo(time);
		TheaterBean tb = tServ.getTheater(timeTable.getTheater());
		Integer minWidth = tb.getTheaterWidth();
		String status = tServ.getTheaterStatus(tb, timeTable);
		model.addAttribute("timeTable", timeTable);
		model.addAttribute("minWidth", minWidth);
		model.addAttribute("seatTable", status);
		return pac + "peekSeat";
	}

	@RequestMapping("/makeOrder")
	public String showOrder(Model model, HttpServletRequest req, HttpSession session) {
		System.err.println("====showOrder Start====");

		String[] seats = req.getParameterValues("seat");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		// ob.sortOrderItem("ticket", "drink");
		// ob.calTotalPrice();
		// to set the chosen seats into order; if return value = -1, the
		// chosen seats has been ordered already
		System.out.println(Arrays.toString(seats));
		if (oServ.setSeatToOrder(ob, seats) == -1) {
			System.err.println("=== Selected seats has been sold already ===");
			model.addAttribute("seatSoldErr", "很抱歉，您所選擇的座位稍早已售出，請重新選擇座位。");
			System.err.println("====showOrder FORWARD TO showSeat====");
			return "forward:/" + pac + "seat";
		}
		System.out.println("set seats success");
		// model.addAttribute("orderItems", ob.getOrderItems());
		System.err.println("====showOrder END====");
		return "redirect:/" + pac + "confirmOrder";
	}

	@RequestMapping("/confirmOrder")
	public String confirmOrder() {
		return pac + "orderItems";
	}

	/**
	 * Cancel an order, and make user go to ticketing
	 * 
	 * @param session HttpSession
	 * @return ticketing page
	 */
	@RequestMapping("/cancel")
	private String cancelOrder(HttpSession session) {
		session.removeAttribute("order");
		session.removeAttribute("discounts");
		return "redirect:/ticketing_1";
	}

	@RequestMapping(value = "/pay")
	public String payByEcPay(HttpSession session, @RequestParam Integer idType, Model model, HttpServletRequest req,
			RedirectAttributes redirect) {
		System.out.println("type = " + idType);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		OrderBean ob = (OrderBean) session.getAttribute("order");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Map<String, String> errMsg = new HashMap<>();
		model.addAttribute("errMsg", errMsg);
		if (idType == 0) { // pay as member
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			String memberName = req.getParameter("memberName");
			String memberEmail = req.getParameter("memberEmail");
			String memberPhone = req.getParameter("memberPhone");
			if (memberPhone == null || memberPhone.trim().length() == 0) {
				errMsg.put("memberPhone", "請輸入您的電話號碼");
				errMsg.put("guest", "false");
				return pac + "orderItems";
			}
			ob.setOwnerId(mb.getMemberId());
			ob.setOwnerName(memberName);
			ob.setOwnerEmail(memberEmail);
			ob.setOwnerPhone(memberPhone);
		} else { // pay as guest
			String guestName = req.getParameter("guestName");
			String guestEmail = req.getParameter("guestEmail");
			String guestPhone = req.getParameter("guestPhone");
			if (guestName == null || guestName.trim().length() == 0) {
				errMsg.put("guestName", "請輸入您的名字");
			}
			if (guestEmail == null || guestEmail.trim().length() == 0) {
				errMsg.put("guestEmail", "請輸入您的Email");
			}
			if (guestPhone == null || guestPhone.trim().length() == 0) {
				errMsg.put("guestPhone", "請輸入您的電話號碼");
			}
			if (!errMsg.isEmpty()) {
				errMsg.put("guest", "true");
				return pac + "orderItems";
			}
			ob.setOwnerId("GUEST");
			ob.setOwnerName(req.getParameter("guestName"));
			ob.setOwnerEmail(req.getParameter("guestEmail"));
			ob.setOwnerPhone(req.getParameter("guestPhone"));
		}
		ob.setOrderTime(ts);
		ob.setOrderId(ob.generateOrderId());
		try {
			oServ.saveOrder(ob);
			System.out.println("save order success in payByEcPay");
		} catch (Exception e) {
			System.err.println("Error when save the order, orderId = " + ob.getOrderId());
			model.addAttribute("seatSoldErr", "很抱歉，您所選擇的座位稍早已售出，請重新選擇座位。");
			return "forward:/" + pac + "seat";
		}
		String base = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath(); // http:localhost:XXXX/eeit108Theater
		// EcPay Begin
		// EcPay對各項method都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime(); // 指定付款方式為信用卡一次付清
		obj.setMerchantTradeNo(ob.getOrderId()); // 設定訂單編號
		obj.setMerchantTradeDate(sdf.format(ts)); // 設定交易日期
		obj.setTotalAmount(String.valueOf(ob.getTotalPrice().intValue())); // 設定總付款金額
		obj.setTradeDesc("716 Theater Order");
		obj.setItemName(ob.getOrderItemString()); // 設定顯示在EcPay頁面的購物清單
		obj.setReturnURL(base + "/order/receive");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL(base + "/order/result"); // EcPay會在付款結束後，將USER redirect至此，並附帶交易結果相關資訊
		obj.setNeedExtraPaidInfo("N"); // Y/N = True/False
		obj.setRedeem("N"); // 紅利 Y/N = True/False
		String form = all.aioCheckOut(obj, null); // null for no invoice
		// all.aioCheckOut會根據前面設定好的參數產生一個html表格的字串，
		// 裡面的各種input都已經設定好了，並且會自動submit，
		// 只要將這個字串加為attribute並且顯示在回傳頁面上，便會自動執行，並跳轉到EcPay付款頁面。
		// EcPay End
		session.removeAttribute("order");
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
	public String result(HttpServletRequest req, Model model) {
		System.err.println("=====CLIENT BACK From EcPay=====");
		Map<String, String[]> map = req.getParameterMap();

		if (map == null || map.size() == 0) { // if the parameter map is null or empty -> Fail to get any information
												// from EcPay
			System.out.println("result map from EcPay is empty");
			model.addAttribute("rtnMsg", "Result Map is Empty");
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
		OrderBean ob = oServ.getOrderById(map.get("MerchantTradeNo")[0]);
		if (ob == null) {
			model.addAttribute("rtnMsg", "OOOOOOOOPS, ORDER IS GONE!!!");
			System.err.println("!!=====Result Fail=====!!");
			return pac + "fail";
		}

		String returnCode = map.get("RtnCode")[0].trim();
		if (!returnCode.equals("1")) { // if RtnCode != 1 -> the trade failed.
			System.out.println("RtnCode =" + returnCode);
			model.addAttribute("rtnMsg", map.get("RtnMsg"));
			ob.setSeats(null);
			System.err.println("!!=====Pay Fail=====!!");
		} else {
			System.out.println("pay success");
			ob.setPaid(true);
		}
		if (oServ.updateOrder(ob) > 0) {
			System.out.println("update success");
			try {
				emailServ.sendEmail(ob);
				System.out.println("send email success");
			} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println("send email fail");
			}
		}
		model.addAttribute("order", ob);
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
}
