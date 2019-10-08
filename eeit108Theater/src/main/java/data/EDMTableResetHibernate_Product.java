package data;

/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.ProductBean;

import data.util.HibernateUtils;

public class EDMTableResetHibernate_Product {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void initData(SessionFactory factory) {
		String line = "";
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		int cnt = 0;
		try {
			tx = session.beginTransaction();

			File file = new File("data/product.dat");
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
					ProductBean pb = new ProductBean();
					pb.setAvailable((token[0].equals("0") ? false : true));
					pb.setName(token[1]);
					pb.setType(token[2]);
					pb.setPrice(Double.valueOf(token[3]));
					session.save(pb);
					System.out.println("新增一筆Product紀錄成功");
					cnt++;
				}

				// 印出資料新增成功的訊息
				// session.flush();
				System.out.println("Product資料新增成功，共" + cnt + "筆");
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
		new EDMTableResetHibernate_Product().initData(factory);
		factory.close();

	}

}