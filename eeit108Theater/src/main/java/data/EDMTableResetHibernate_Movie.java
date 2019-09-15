package data;

/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Arrays;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.entity.MovieBean;
import com.web.entity.TimeTableBean;

import data.util.HibernateUtils;
import data.util.SystemUtils2018;

public class EDMTableResetHibernate_Movie {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[])
	{

		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try
		{
			tx = session.beginTransaction();
			File file = new File("data/movie/movie_list.dat");
			try (
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);
//				FileReader fr = new FileReader(file); 
//				BufferedReader br = new BufferedReader(fr);
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
					MovieBean movie = new MovieBean();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					movie.setMovieName(token[0]);
					movie.setDirectorsAsArray(token[1].split(","));
					movie.setCastsAsArray(token[2].split(","));
					movie.setIntroduction(token[3]);
					movie.setCompany(token[4]);
					System.out.println(token[5]);
					String[] links = token[5].split(",");
					movie.setTrailerLink(links);
					movie.setDuration(Integer.parseInt(token[6]));
					movie.setOpeningDate(sdf.parse(token[7]));
					movie.setEndingDate(sdf.parse(token[8]));
					movie.setLanguages(token[9]);
					movie.setGenres(token[10]);
					Blob sb = SystemUtils2018.fileToBlob(token[11]);
					movie.setMovieImage(sb);
					session.save(movie);
					System.out.println("新增一筆movie紀錄成功");
				}

				// 印出資料新增成功的訊息
				System.out.println("movie資料新增成功");

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