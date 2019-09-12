package packageForTest.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
			DateFormat d = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

			for (int i = 0; i < 5; i++) {
				MemberBean mb = new MemberBean();
				mb.setAvailable(true);
				mb.setEmail("try" + i + "@ggmail.com");
				mb.setMemberId("a12345678" + i);
				mb.setPassword("Do!ng123");
				mb.setName("TESTER");
				mb.setCommentPermission(true);
				mb.setBanCounter(0);
				mb.setBirthday(d.parse("1999-05-1" + i + " 16-52-03"));
				mb.setPhoneNum("0912345678");
				mb.setRegisterTime(new Date());
				session.save(mb);
			}
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
		}
		factory.close();
	}

}