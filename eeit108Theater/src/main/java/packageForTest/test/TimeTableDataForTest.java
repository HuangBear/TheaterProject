package packageForTest.test;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MovieBean;
import com.web.entity.SeatBean;
import com.web.entity.TimeTableBean;

import packageForTest.util.HibernateUtils;

public class TimeTableDataForTest {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TimeTableBean tb = new TimeTableBean();
			tb.setAvailable(true);
			tb.setDuration(120);
			tb.setStartTime(new Date(1999, 9, 10, 12, 20));
			tb.setEndTime(new Date(1999, 9, 10, 14, 20));
			tb.setTheater("A");
			tb.setVersion("3D");
			tb.setMovie(session.get(MovieBean.class, 1));
			tb.setMovieName(tb.getMovie().getMovieName());
			Set<SeatBean> seats = new HashSet<>();
			SeatBean sb = new SeatBean();
			sb.setAvailable(true);
			sb.setRow("A");
			sb.setColumn("8");
			seats.add(sb);
			sb = new SeatBean();
			sb.setAvailable(true);
			sb.setRow("A");
			sb.setColumn("9");
			seats.add(sb);
			tb.setSeats(seats);
			session.save(tb);
			tx.commit();
			System.out.println("========新增timeTable成功============");
		} catch (Exception e) {
			tx.rollback();
			System.out.println("========新增timeTable失敗============");
			e.printStackTrace();
		}
		session.close();
		factory.close();
	}

}
