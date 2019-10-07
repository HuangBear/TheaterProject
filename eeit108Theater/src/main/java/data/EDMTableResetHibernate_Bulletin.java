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

import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;

public class EDMTableResetHibernate_Bulletin {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			File file = new File("data/bulletin/bulletin_list.dat");
			try (FileInputStream fis = new FileInputStream(file);
					InputStreamReader isr = new InputStreamReader(fis, "UTF8");
					BufferedReader br = new BufferedReader(isr);
//				FileReader fr = new FileReader(file); 
//				BufferedReader br = new BufferedReader(fr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					BulletinBean bulletin = new BulletinBean();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					bulletin.setAvailable(Boolean.valueOf(token[0]));
					bulletin.setTitle(token[1]);
					bulletin.setContext(token[2]);
					bulletin.setStartDate(token[3]);
					bulletin.setEndDate(token[4]);
					bulletin.setPostTime(sdf.parse(token[5]));
					bulletin.setDiscount(Integer.valueOf(token[6]));
					bulletin.setDiscountTicketBuy(
							token[7].equals("") ? null : Integer.valueOf(token[7]));
					bulletin.setDiscountTicketFree(
							token[8].equals("") ? null : Integer.valueOf(token[8]));
					bulletin.setDiscountPriceBuy(
							token[9].equals("") ? null : Integer.valueOf(token[9]));
					bulletin.setDiscountPriceFree(
							token[10].equals("") ? null : Integer.valueOf(token[10]));
					EmployeeBean employee = session.get(EmployeeBean.class, 2);
					bulletin.setEmployee(employee);
					Blob sb = SystemUtils2018.fileToBlob(token[11]);
					bulletin.setCoverImage(sb);
					bulletin.setFileName(SystemUtils2018.extractFileName(token[11].trim()));
					bulletin.setBortingId(token[12]);
					session.save(bulletin);
					System.out.println("新增一筆bulletin紀錄成功");
				}

				// 印出資料新增成功的訊息
				// session.flush();
				System.out.println("bulletin資料新增成功");
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				tx.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		factory.close();

	}

}