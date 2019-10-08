package data;

/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MemberBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;

public class EDMTableResetHibernate_Member {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void initData(SessionFactory factory) {
		String line = "";
		// SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			File file = new File("data/member/memberlist.dat");
			try (FileInputStream fis = new FileInputStream(file);
					InputStreamReader isr = new InputStreamReader(fis, "UTF8");
					BufferedReader br = new BufferedReader(isr);

			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split(",");
					MemberBean member = new MemberBean();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					member.setAvailable(true);
					member.setBanCounter(0);
					member.setBirthday(sdf.parse(token[15]));
					member.setCommentPermission(true);
					member.setEmail(token[4]);

					member.setGender(Integer.parseInt(token[5]));
					member.setMemberId(token[6]);
					Blob sb = SystemUtils2018.fileToBlob(token[7]);
					member.setMemberImage(sb);
					member.setImageFileName(token[11]);
					member.setName(token[8]);
					member.setPassword(token[9]);
					member.setPhoneNum(token[10]);

					member.setRegisterTime(sdf.parse(token[14]));
					member.setAboutMe(token[12]);
					member.setEmailActiveStatus(true);

					session.save(member);
					System.out.println("新增member紀錄一筆成功");
				}

				// 印出資料新增成功的訊息
				System.out.println("member資料新增成功");

				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				tx.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
	
		SessionFactory factory = HibernateUtils.getSessionFactory();
		new EDMTableResetHibernate_Member().initData(factory);
		factory.close();

	}

}