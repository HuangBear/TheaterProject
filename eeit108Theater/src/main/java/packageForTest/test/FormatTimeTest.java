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
		
		String hash = "1260524851";
//		EB1260524851				NA192200437
		long l = Long.valueOf(hash);
		System.out.println("hash " + hash + "'s hex = " + Long.toHexString(l));
		System.out.println("current time hex = " + Long.toHexString(System.currentTimeMillis()));
	}
}
