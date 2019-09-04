package packageForTest.test;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MovieBean;

import packageForTest.util.HibernateUtils;

public class MovieTest {

	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		System.out.println("Main started");
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx;
//		MovieBean movie = new MovieBean();
//		movie.setMovieName("Test Movie");
//		movie.setOpeningDate(new Date());
//		movie.setTrailerLink(new String[] {"one", "n", "three"});
		tx = session.beginTransaction();
		try {
			for (int i = 0; i < 5; i++) {
				MovieBean movie = new MovieBean();
				movie.setMovieName("Test Movie" + i);
				movie.setOpeningDate(new Date());
				movie.setTrailerLink(new String[] { "one", String.valueOf(i % 2), String.valueOf(i) });
				session.save(movie);
			}
			tx.commit();
			System.out.println("new Movie success");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("=======new Movie Fail=======");
			tx.rollback();
		}
		session = factory.getCurrentSession();
		tx = session.beginTransaction();
		try {
			String hql = "FROM MovieBean m WHERE m.trailerLink like :trLink";
			List<MovieBean> list = session.createQuery(hql).setParameter("trLink", "%one%")
					.getResultList();
//			String hql = "FROM MovieBean";
//			List<MovieBean> list = session.createQuery(hql).getResultList();
			if (list != null) {
				if (list.isEmpty()) {
					System.out.println("Result List is Empty ");
				} else {
					for (MovieBean m : list) {
						System.out.println(Arrays.toString(m.getTrailerLink()));
					}
				}
			} else {
				System.out.println("Result List is NULL ");
			}
//			String[] s = mBean.getTrailerLink();
//			System.out.println(s[0]+","+s[1]);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		session.close();
		factory.close();
		System.out.println("Main Ended");
	}

}
