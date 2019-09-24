package com.web.util;

import java.security.*;
import java.util.*;

import javax.crypto.*;
import javax.crypto.spec.*;
import javax.xml.bind.*;

public class SecurityCipher {
	/**** Block Cipher ****/
	// ECB mode cannot use IV
	private static String transformationECB = "AES/ECB/PKCS5Padding";
	// 若想使用 IV，則不建議再配合MD5的唯一(Hash)特性，因為MD5演算法無法回頭，與IV每次不同的特性兩者相互違背
	private static String transformationCBC = "AES/CBC/PKCS5Padding";

	private static final String KEY = "KittySnoopyMicky"; // AES加密：16,24,32位元組(java：16預設，24與32需額外官網下載jar)

	public static String encryptStringWithIV(String message) {
		String encryptedString = "";
		byte[] iv = new byte[128 / 8]; // BlockCipher為16位元組要求(AES使用長度無關)，使產生每次不同(打亂)
		SecureRandom srnd = new SecureRandom(); // 嚴格亂數產生
		srnd.nextBytes(iv);

		if (message == null || message.trim().length() == 0) {
			return null;
		}

		try {
			Cipher cipher = Cipher.getInstance(transformationCBC);
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(iv));

			byte[] msgbyte = cipher.doFinal(message.getBytes());
			byte[] buffer = new byte[iv.length + msgbyte.length];
			System.arraycopy(iv, 0, buffer, 0, iv.length); // 來源陣列，來源起始index，目的陣列，目的起始index，複製長度
			System.arraycopy(msgbyte, 0, buffer, iv.length, msgbyte.length);

			// 任何形式的資料以Base64的方式統一重編碼(非加密)，同時利用它好用的byte[]轉String的method
			encryptedString = DatatypeConverter.printBase64Binary(buffer);

		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
	}

	public static String encryptString(String message) {
		String encryptedString = "";

		if (message == null || message.trim().length() == 0) {
			return null;
		}

		try {
			Cipher cipher = Cipher.getInstance(transformationECB);
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);

			byte[] msgbyte = cipher.doFinal(message.getBytes());

			// 任何形式的資料以Base64的方式統一重編碼(非加密)，同時利用它好用的byte[]轉String的method
			encryptedString = DatatypeConverter.printBase64Binary(msgbyte);

		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
	}

	public static String decryptStringWithIV(String message) {
		String decryptedString = "";
		byte[] iv = new byte[128 / 8]; // BlockCipher為16位元組要求(AES使用長度無關)，使產生每次不同(打亂)

		if (message == null || message.trim().length() == 0) {
			return null;
		}

		try {
			Cipher cipher = Cipher.getInstance(transformationCBC);
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");

			// 與encryptString同理用Base64的方式統一，利用它String轉byte[]的method還原
			byte[] bufferbytes = DatatypeConverter.parseBase64Binary(message);

			iv = Arrays.copyOfRange(bufferbytes, 0, iv.length); // 來源陣列，來源起始index，來源結束index(非長度)
			byte[] msgbyte = Arrays.copyOfRange(bufferbytes, iv.length, bufferbytes.length);

			cipher.init(Cipher.DECRYPT_MODE, secretKey, new IvParameterSpec(iv));
			decryptedString = new String(cipher.doFinal(msgbyte));

		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
	}

	public static String decryptString(String message) {
		String decryptedString = "";

		if (message == null || message.trim().length() == 0) {
			return null;
		}

		try {
			Cipher cipher = Cipher.getInstance(transformationECB);
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");

			// 與encryptString同理用Base64的方式統一，利用它String轉byte[]的method還原
			byte[] bufferbytes = DatatypeConverter.parseBase64Binary(message);

			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			decryptedString = new String(cipher.doFinal(bufferbytes));

		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
	}

	/**** MD5 是一種雜湊演算法, 它會固定生成128 位元(16個位元組) ****/
	/**** 並以32個16 進制數字字串輸出，因1個位元組(8位元)可表示2個16 進制數字 ****/
	public static String getStringMD5(String message) {
		return getStringHash(message, "MD5");
	}

	public static String getStringSHA1(String message) {
		return getStringHash(message, "SHA1");
	}

	private static String getStringHash(String message, String algorithm) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm); // 實作演算法類別
			md.update(message.getBytes()); // byte[]要求
			byte[] digest = md.digest(); // 回傳加密後byte[]

			/**** byte[]轉 16 進制 ****/
			for (int i = 0; i < digest.length; ++i) {
				byte b = digest[i];
				String s = Integer.toHexString(Byte.toUnsignedInt(b));
				s = s.length() < 2 ? "0" + s : "" + s; // 16 進制位數不足2位，前面補0
				buffer.append(s);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("請檢查使用的演算法，演算法有誤");
			return null;
		}
		return buffer.toString();
	}

	public static void main(String[] args) {
		String teststr = "測試123"
				+ "";

		String encIVStr = encryptStringWithIV(teststr);
		String decIVStr = decryptStringWithIV(encIVStr);
		System.out.println("======== With IV ========");
		System.out.println(encIVStr);
		System.out.println(decIVStr);

		String encStr = encryptString(teststr);
		String decStr = decryptString(encStr);
		System.out.println("======== No IV ========");
		System.out.println(encStr);
		System.out.println("MD5 : " + getStringMD5(encStr));
		System.out.println(decStr);
	}
}