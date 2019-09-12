package data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MovieBean;
import com.web.entity.TimeTableBean;

import data.util.HibernateUtils;

public class EDMTableResetHibernate_TimeTable {
	
	public static final String UTF8_BOM = "\uFEFF";
	
	public static void main(String[] args) {
		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try
		{
			tx = session.beginTransaction();
			File file = new File("data/time/timetable.dat");
			try (
				FileReader fr = new FileReader(file); 
				BufferedReader br = new BufferedReader(fr);
			)
			{
				while ((line = br.readLine()) != null)
				{
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM))
					{
						line = line.substring(1);
					}
						String[] token = line.split("\\|");
						
						DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String[] splitBlank = token[2].split(" ");
						String[] splitColon = splitBlank[1].split(":");
						int hour = Integer.parseInt(splitColon[0]);
						int minute = Integer.parseInt(splitColon[1]);
						int sum = hour * 60 + minute;
						int breakTime = Integer.parseInt(token[6]);
						
					do {
						TimeTableBean time = new TimeTableBean();
						boolean boolean1 = Boolean.parseBoolean(token[0]);
						time.setAvailable(boolean1);
						time.setMovieName(token[1]);
						
						time.setStartTime(sdf.parse(token[2]));
						int duration = Integer.parseInt(token[3]);
						if (duration % 10 != 0) {                      // 使每場電影的間隔尾數不是0以外的數字
							duration += 10 - (duration % 10);
						}
						sum += duration + breakTime;
						String HH = String.valueOf(sum / 60);
						String mm = String.valueOf(sum % 60);
						
						token[2] = splitBlank[0] + " " + HH + ":" + mm;

						time.setDuration(Integer.parseInt(token[3]));
						time.setVersion(token[4]);
						time.setTheater(token[5]);
						time.setMovie(session.get(MovieBean.class, 1));
						time.setBreakTime(breakTime);
						session.save(time);
	
						System.out.println("新增一筆time紀錄成功");
					} while(sum < 1440);
				}

				// 印出資料新增成功的訊息
				System.out.println("time資料新增成功");

				tx.commit();
			} catch (Exception e)
			{
				e.printStackTrace();
				tx.rollback();
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		factory.close();

	}

}


