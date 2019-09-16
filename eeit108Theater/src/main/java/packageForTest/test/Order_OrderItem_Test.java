package packageForTest.test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;

import packageForTest.util.HibernateUtils;

public class Order_OrderItem_Test {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
//			OrderBean ob = new OrderBean();
//			ob.setAvailable(true);
//			ob.setOrderId("778899");
//			List<OrderItemBean> map = new ArrayList<OrderItemBean>();
//			ob.setOrderItems(map);
//			ob.setOwnerId("tester");
//			ob.setOwnerEmail("123456@ggggmail.com");
//			ob.setOrderTime(new Timestamp(new Date().getTime()));
//			ob.setTotalPrice(0.0);
//			for (int i = 0; i < 5; i++) {
//				OrderItemBean oib = new OrderItemBean();
//				oib.setAvailable(true);
//				oib.setItemName("test" + i);
//				oib.setQuantity(i);
//				oib.setType("testType" + i % 2);
//				oib.setUnitPrice(10.0);
//				oib.setSumPrice(oib.getUnitPrice() * oib.getQuantity());
//				map.add(oib);
//			}
//			session.save(ob);
//			tx.commit();
//			System.out.println("insert one order success");
//		} catch (Exception e) {
//			tx.rollback();
//			System.err.println("insert error");
//			e.printStackTrace();
//		}
		//session = factory.getCurrentSession();
		//tx = null;
		try {
			tx = session.beginTransaction();
			OrderBean ob = session.get(OrderBean.class, 4);
			for (OrderItemBean oib : ob.getOrderItems()) {
				System.out.println("====== name = " + oib.getItemName() + " quantity = " + oib.getQuantity() + " type = " + oib.getType());
			}
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			System.err.println("query error");
			e.printStackTrace();
		}
		
		
		factory.close();

	}

}
