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
import com.web.entity.TheaterBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;

public class EDMTableResetHibernate_Theater {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			File file = new File("data/theater.dat");
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
					TheaterBean tb = new TheaterBean();
					tb.setTheater(token[0]);
					tb.setRowCnt(Integer.valueOf(token[1]));
					tb.setZone(Integer.valueOf(token[2]));
					tb.setMiddle(Integer.valueOf(token[3]));
					tb.setSide(Integer.valueOf(token[4]));
					tb.setSubside(Integer.valueOf(token[5]));
					String spaceRowString = token[6];
					String[] spaceRowStringArray = null;
					if(spaceRowString != null && !spaceRowString.trim().equals("")) {
						spaceRowStringArray = token[6].split(",");				
						Integer[] spaceRow = new Integer[spaceRowStringArray.length];
						for (int i = 0; i < spaceRowStringArray.length; i++) {
							spaceRow[i] = Integer.valueOf(spaceRowStringArray[i]);
						}
						tb.setSpaceRow(spaceRow);
					}
					String optionSeatString = token[7];
					String[] optionSeatStringArray = null;
					if(optionSeatString != null && !optionSeatString.trim().equals("")) {
						optionSeatStringArray = token[7].split(",");										
						tb.setOptionSeat(optionSeatStringArray);
					}
					session.save(tb);
					System.out.println("新增一筆Theater紀錄成功");
				}

				// 印出資料新增成功的訊息
				// session.flush();
				System.out.println("Theater資料新增成功");
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