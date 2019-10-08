package data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MemberBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.ProductBean;
import com.web.entity.SeatBean;
import com.web.entity.TheaterBean;
import com.web.entity.TimeTableBean;

import data.util.HibernateUtils;

public class EDMTableResetHibernate_Order {

	public static final String UTF8_BOM = "\uFEFF";
	final static String PRODUCT_HQL = "FROM ProductBean pb WHERE pb.available = 1 AND pb.type = :type";
	final static String TICKET_HQL = "FROM ProductBean p WHERE p.name like :version AND p.type = 'ticket' AND p.available = 1";
	final static String SEAT_HQL = "FROM SeatBean s WHERE s.timeTableId = :tid";

	public static void main(String[] args) {

		SessionFactory factory = HibernateUtils.getSessionFactory();
		new EDMTableResetHibernate_Order().initData(factory);
		factory.close();
	}

	@SuppressWarnings("unchecked")
	public void initData(SessionFactory factory) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			List<TimeTableBean> timeList = session.createQuery("FROM TimeTableBean t").list();
			List<MemberBean> memberList = session.createQuery("FROM MemberBean").list();
			memberList.addAll(getGuestList());
			Map<String, List<ProductBean>> ticketList = new HashMap<>();
			ticketList.put("2D", session.createQuery(TICKET_HQL).setParameter("version", "%2D%").list());
			ticketList.put("3D", session.createQuery(TICKET_HQL).setParameter("version", "%3D%").list());
			ticketList.put("IMAX", session.createQuery(TICKET_HQL).setParameter("version", "%IMAX%").list());
			List<ProductBean> drinkList = session.createQuery(PRODUCT_HQL).setParameter("type", "drink").list();
			List<ProductBean> foodList = session.createQuery(PRODUCT_HQL).setParameter("type", "food").list();
			int cnt = 0;
			int timeTableCnt = 0;
			int totalTime = timeList.size();
			for (TimeTableBean tb : timeList) {
				timeTableCnt++;
				int dataNum;
				if(tb.getVersion().equals("2D"))
					dataNum = random(1,3);
				else if(tb.getVersion().equals("3D"))
					dataNum = random(2,5);
				else
					dataNum = random(5,random(6,10));
				Map<String, Boolean> seatMap = new HashMap<>();
				List<SeatBean> tempSeatList = session.createQuery(SEAT_HQL).setParameter("tid", tb.getNo()).list();
				for (SeatBean sb : tempSeatList) {
					seatMap.put(sb.getSeatString(), true);
				}
				for (int times = 0; times < dataNum; times++) {
					OrderBean ob = new OrderBean();
					ob.setTimeTable(tb);
					ob.setPaid(dice(1, 5)); // 付款與否

					if (ob.getPaid()) // 付款成功的話 取票與否
						ob.setChecked(dice(1, 5));
					ob.setAvailable(ob.getPaid());
					MemberBean owner = memberList.get(random(0, memberList.size() - 1));
					ob.setOwnerEmail(owner.getEmail());
					ob.setOwnerId(owner.getMemberId());
					ob.setOwnerName(owner.getName());
					ob.setOwnerPhone(owner.getPhoneNum());
					if (ob.getAvailable()) { // 付款成功才新增座位與商品
						final int peopleCnt = random(1, 10);
						List<OrderItemBean> orderList = getTicketItem(ticketList.get(tb.getVersion()), peopleCnt);
						orderList.addAll(getOrderItem(drinkList, random(0, peopleCnt / 2 + 1), random(0, peopleCnt)));
						orderList.addAll(getOrderItem(foodList, random(0, peopleCnt / 2 + 1), random(0, peopleCnt)));
						ob.setOrderItems(orderList);

						TheaterBean theater = (TheaterBean) session
								.createQuery("FROM TheaterBean t WHERE t.theater = :theater")
								.setParameter("theater", tb.getTheater()).uniqueResult();

						for (String nullSeat : theater.getNullSeat()) {
							seatMap.put(nullSeat, true);
						}
						List<SeatBean> seatList = new ArrayList<>();
						// int tCnt = 0;
						int maxRow = theater.getRowCnt();
						int maxCol = theater.getMaxSeat();
						while (seatList.size() < peopleCnt) {
							char row = (char) random((int) 'A', (int) ('A' + maxRow - 1));
							int col = random(1, maxCol);
							chooseSeat(seatList, row, col + 1, peopleCnt, seatMap, maxRow, maxCol);
						}
						for (SeatBean sb : seatList) {
							sb.setTimeTableId(tb.getNo());
						}
						ob.setSeats(seatList);
						ob.calTotalPrice();
						session.detach(theater);
					}
					Date orderDate = sdf.parse(tb.getStartDate());
					int month = orderDate.getMonth();
					orderDate.setMonth(random(0, month));
					ob.setOrderTime(new Timestamp(orderDate.getTime()));
					ob.setOrderId(ob.generateOrderId());
					session.save(ob);
					
					System.out.println("新增一筆訂單成功 :" + ++cnt + "，時刻表：" + timeTableCnt + " / " + totalTime);
				}
			}

			tx.commit();
			System.out.println("新增Order, OrderItem, Seat資料成功");
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			System.out.println("新增資料失敗");
		}
		factory.close();

	}

	private void chooseSeat(List<SeatBean> list, char row, int col, int maxTicket, Map<String, Boolean> seatMap,
			int maxRow, int maxCol) {
		if (col > maxCol || row - 'A' + 1 > maxRow)
			return;
		if (list.size() >= maxTicket)
			return;
		String rowCol = String.valueOf(row) + col;
		if (seatMap.containsKey(rowCol))
			return;

		seatMap.put(rowCol, true);
		SeatBean seat = new SeatBean();
		seat.setRow("" + row);
		seat.setColumn(col);
		list.add(seat);

		chooseSeat(list, row, col + 1, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, row, col - 1, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row + 1), col, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row - 1), col, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row + 1), col + 1, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row - 1), col - 1, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row + 1), col - 1, maxTicket, seatMap, maxRow, maxCol);
		chooseSeat(list, (char) (row - 1), col + 1, maxTicket, seatMap, maxRow, maxCol);
	}

	private boolean dice(int numerator, int denominator) {
		int random = (int) (Math.random() * denominator) + 1;
		//System.out.println("random = " + random);
		if (random > numerator)
			return true;
		return false;
	};

	private int random(int from, int to) {
		int random = (int) (Math.random() * (to - from + 1)) + from;
		return random;
	};

	private List<MemberBean> getGuestList() {
		List<MemberBean> guests = new ArrayList<>();
		String line = "";
		File file = new File("data/guest.dat");
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				MemberBean guest = new MemberBean();
				//System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split(",");
				guest.setEmail(token[0]);
				guest.setPhoneNum(token[1]);
				guest.setName(token[2]);
				guest.setMemberId(null);
				guests.add(guest);
			}
		} catch (IOException e) {
			System.out.println("訪客list建立失敗");
			e.printStackTrace();
		}
		return guests;
	}

	private List<OrderItemBean> getOrderItem(List<ProductBean> product, int categoryCnt, int peopleCnt) {
		List<OrderItemBean> oibList = new ArrayList<>();
		if (categoryCnt <= 0 || peopleCnt <= 0)
			return oibList;
		for (int i = 0; i < categoryCnt; i++) {
			OrderItemBean oib = new OrderItemBean(product.get(random(0, product.size() - 1)));
			oib.setQuantity(random(1, peopleCnt));
			oib.calSumPrice();
			oibList.add(oib);
		}
		return oibList;
	}

	private List<OrderItemBean> getTicketItem(List<ProductBean> product, int peopleCnt) {
		List<OrderItemBean> oibList = new ArrayList<>();
		if (peopleCnt <= 0)
			return oibList;

		OrderItemBean oib = new OrderItemBean(product.get(random(0, product.size() - 1)));
		oib.setQuantity(peopleCnt);
		oib.calSumPrice();
		oibList.add(oib);

		return oibList;
	}

}
