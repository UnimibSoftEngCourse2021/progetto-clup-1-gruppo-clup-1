package main.webapp.DAO;

import java.security.MessageDigest;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PasswordHashing {

	public static String doHashing(String password) {
		Logger logger = Logger.getLogger(PasswordHashing.class.getName());
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(password.getBytes());
			byte[] resultByteArray = messageDigest.digest();

			StringBuilder sb = new StringBuilder();

			for (byte b : resultByteArray) {
				sb.append(String.format("%02x", b));
			}
			System.out.println(sb);

			return sb.toString();
		} catch (Exception e) {
			logger.log(Level.FINE, e.toString());
		}
		return "";
	}
}