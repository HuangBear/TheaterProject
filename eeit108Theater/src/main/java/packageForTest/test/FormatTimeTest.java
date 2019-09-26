package packageForTest.test;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class FormatTimeTest {

	public static void main(String[] args) {
		String str = "2015-03-31";
		Date date = Date.valueOf(str);// converting string into sql date
		//System.out.println(date);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println(System.currentTimeMillis());
		System.out.println(new Timestamp(System.currentTimeMillis()));
		System.out.println(String.valueOf(new Timestamp(System.currentTimeMillis())));
		System.out.println(new Date(System.currentTimeMillis()));
		System.out.println(String.valueOf(new Date(System.currentTimeMillis())));
		System.out.println(sdf.format(new Date(System.currentTimeMillis())));
		System.out.println(sdf.format(new Timestamp(System.currentTimeMillis())));

	}
}
