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
import com.web.entity.MovieBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;



public class EDMTableResetHibernate2 {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			File file = new File("data/emp_list.dat");
			try (
				FileInputStream fis = new FileInputStream(file);
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
					EmployeeBean Employee = new EmployeeBean();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Employee.setAvailable(Boolean.parseBoolean(token[0]));
					Employee.setBirthday(sdf.parse(token[1]));
					Employee.setEmail(token[2]);
					Employee.setEmployeeId(token[3]);
					Employee.setEmployeeImage(null);
					Employee.setGender(Integer.parseInt(token[5]));
					Employee.setName(token[6]);
					Employee.setPassword(token[7]);
					Employee.setPermission(Integer.parseInt(token[8]));
					Employee.setPhoneNum(token[9]);
					Employee.setRegisterTime(sdf.parse(token[10]));
					Employee.setResignTime(sdf.parse(token[11]));
					Employee.setSalary(Integer.parseInt(token[12]));
					//Blob sb = SystemUtils2018.fileToBlob(token[11]);
					//movie.setMovieImage(sb);
					session.save(Employee);
					System.out.println("新增一筆EMP紀錄成功");
				}
				// 印出資料新增成功的訊息
				//session.flush();
				System.out.println("EMP資料新增成功");
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