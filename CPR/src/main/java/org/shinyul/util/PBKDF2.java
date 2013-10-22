package org.shinyul.util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PBKDF2 {

	// 임의 salt를 생성
	private static byte[] createSalt() throws NoSuchAlgorithmException {
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		logging("random : ", random.getAlgorithm());
		byte[] salt = new byte[32];
		random.nextBytes(salt);
		return salt;
	}

	private static byte[] pbkdf2(char[] password, byte[] salt)
			throws InvalidKeySpecException, NoSuchAlgorithmException {
		SecretKeyFactory sf = SecretKeyFactory
				.getInstance("PBKDF2WithHmacSHA1");
		// 반복 횟수 : 10000 번 결과 길이 : 256bit
		KeySpec ks = new PBEKeySpec(password, salt, 10000, 512);
		SecretKey sk = sf.generateSecret(ks);
		return sk.getEncoded();
	}

	private static void logging(String format, Object... args) {
		System.out.printf(format + "%n", args);
	}

	public static boolean authenticate(char[] attemptedPassword,
			byte[] encryptedPassword, byte[] salt)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] encryptedAttemptedPassword = pbkdf2(attemptedPassword, salt);
		return Arrays.equals(encryptedPassword, encryptedAttemptedPassword);
	}

//	public static void main(String[] args) throws NoSuchAlgorithmException,
//			InvalidKeySpecException {
//		// String p1 = args[0];
//		// String p2 = args[1];
//		String p1 = "fjiewo4124";
//		String p2 = "akbakb";
//
//		//새롭게 생성한 salt와 salt를 적용시킨 pw를 저장.. 검증시 salt 불러와 입력받은 패스워드랑 조합해서 db의 pw랑 체크..?	
//		logging("password 1= %s", p1);
//		logging("password 2= %s", p2);
//
//		byte[] salt = createSalt();
//		logging("salt: %s", Arrays.toString(salt));
//
//		byte[] d1 = pbkdf2(p1.toCharArray(), salt);
//		byte[] d2 = pbkdf2(p2.toCharArray(), salt);
//		logging("derived 1= %s", Arrays.toString(d1));
//		logging("derived 2= %s", Arrays.toString(d2));
//
//		//검증  - 저장된 salt 키 가져와서 맞춰봐야 되는듯?
//		System.out.println("check 1 : "
//				+ authenticate(p1.toCharArray(), d1, salt));
//		System.out.println("check 2 : "
//				+ authenticate(p1.toCharArray(), d2, salt));
//	}
}
