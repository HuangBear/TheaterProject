package packageForTest.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MemberBean;

import packageForTest.util.HibernateUtils;

public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			MemberBean mb = new MemberBean();
			mb.setAvailable(true);
			mb.setEmail("try@ggmail.com");
			mb.setMemberId("a123456789");
			mb.setPassword("Do!ng123");
			DateFormat d = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

			mb.setRegisterTime(d.parse("1999-05-12 16-52-33"));
			session.save(mb);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
		}
	}

}