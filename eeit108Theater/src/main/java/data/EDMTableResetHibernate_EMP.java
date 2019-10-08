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

import com.web.entity.EmployeeBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;

public class EDMTableResetHibernate_EMP {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void initData(SessionFactory factory) {
		String line = "";
		//SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			File file = new File("data/Employee/empList.dat");
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
					EmployeeBean emp = new EmployeeBean();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					emp.setAvailable(true);
					emp.setPermission(Integer.parseInt(token[2]));
					;
					emp.setBirthday(sdf.parse(token[9]));

					emp.setEmail(token[1]);

					emp.setGender(Integer.parseInt(token[0]));
					emp.setEmployeeId(token[3]);
					Blob sb = SystemUtils2018.fileToBlob(token[4]);
					emp.setEmployeeImage(sb);
					emp.setImageFileName(token[4]);
					emp.setName(token[5]);
					emp.setPassword(token[6]);
					emp.setPhoneNum(token[7]);

					emp.setRegisterTime(sdf.parse(token[8]));
					emp.setSalary(Integer.parseInt(token[10]));

					session.save(emp);
					System.out.println("新增emp紀錄一筆成功");
				}

				// 印出資料新增成功的訊息
				System.out.println("emp資料新增成功");

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
		new EDMTableResetHibernate_EMP().initData(factory);
		factory.close();

	}

}