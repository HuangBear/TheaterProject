package packageForTest.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MemberBean;

import packageForTest.util.HibernateUtils;

public class MemberTest {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx;
		tx = session.beginTransaction();
		try {

			MemberBean mb = session.get(MemberBean.class, 1);
			if (mb != null) {
				System.out.println("get member success");
				System.out.println("name = " + mb.getName());
				System.out.println("getMemberId = " + mb.getMemberId());
				System.out.println("getEmail = " + mb.getEmail());
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		factory.close();

	}

}
