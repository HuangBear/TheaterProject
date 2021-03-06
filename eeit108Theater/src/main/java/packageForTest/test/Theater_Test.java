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
import com.web.entity.SeatBean;
import com.web.entity.TheaterBean;
import com.web.entity.TimeTableBean;

import packageForTest.util.HibernateUtils;

public class Theater_Test {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TheaterBean tb = new TheaterBean();
			tb.setNo(41);
			tb.setMiddle(15);
			tb.setRowCnt(15);
			tb.setSide(10);
			tb.setSpaceRow(new Integer[]{5,7,8,9});
			tb.setTheater("A廳");
			tb.setZone(3);
			tb.setPreserveSeat(new String[]{"A1=preserveSeat","A2=preserveSeat","A3=preserveSeat","A4=preserveSeat","A5=preserveSeat"});
			session.update(tb);
			tx.commit();
			System.out.println("insert one order success");
		} catch (Exception e) {
			tx.rollback();
			System.err.println("insert error");
			e.printStackTrace();
		}
		factory.close();

	}

}
