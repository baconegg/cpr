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

//	private static PBKDF2 pbkdf2 = new PBKDF2();
//	
//	public static PBKDF2 getPbkdf2(){
//		return pbkdf2;
//	}
	
	// 임의 salt를 생성
	public static byte[] createSalt() throws NoSuchAlgorithmException {
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		logging("random : ", random.getAlgorithm());
		byte[] salt = new byte[32];
		random.nextBytes(salt);
		return salt;
	}

	public static byte[] changeByte(String salt){
		
//		List<Byte> list = new ArrayList<Byte>();
		
		int size = salt.length()/2;
		String two[] = new String[size];
//		StringBuffer sb = new StringBuffer();
		
		byte[] result = new byte[size];
		
		for(int i = 0; i < size; i++){
			two[i] = salt.substring(i*2, ((i*2)+2));
//			System.out.print(two[i]);
			byte tmp = (byte) Integer.parseInt(two[i], 16);
//			System.out.printf("%02X\n", tmp);
//			System.out.println(Integer.parseInt("ff", 16));
//			sb.append((char)Integer.parseInt(two[i], 16));
//			list.add(tmp);
			result[i] = tmp;
		}
		
//		System.out.printf("%02X\n", sb.toString().getBytes());
//		System.out.println(list.toArray() instanceof Byte[]);
//		ArrayUtils.toPrimitive((Byte[]) list.toArray());
		
		return result;
	}
	
	
	public static byte[] pbkdf2(char[] password, byte[] salt)
			throws InvalidKeySpecException, NoSuchAlgorithmException {
		SecretKeyFactory sf = SecretKeyFactory
				.getInstance("PBKDF2WithHmacSHA1");
		// 반복 횟수 : 10000 번 결과 길이 : 256bit
		KeySpec ks = new PBEKeySpec(password, salt, 10000, 256);
		SecretKey sk = sf.generateSecret(ks);
		return sk.getEncoded();
	}

	public static void logging(String format, Object... args) {
		System.out.printf(format + "%n", args);
	}

	
	public static String changeDiget(byte[] digest){
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < digest.length; i++){
//			System.out.printf("%X" ,tmp[i]); 
			sb.append(String.format("%02X", digest[i]));
		}
		return sb.toString();
	}
	
	public static boolean authenticate(char[] attemptedPassword,
			byte[] encryptedPassword, byte[] salt)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] encryptedAttemptedPassword = pbkdf2(attemptedPassword, salt);
		return Arrays.equals(encryptedPassword, encryptedAttemptedPassword);
	}

	
	public static void main(String[] args) throws NoSuchAlgorithmException,
			InvalidKeySpecException {
		// String p1 = args[0];
		// String p2 = args[1];
		String p1 = "password1";
//		String p2 = "akbakb";
//		String p2 = "fjiewo4124";

		//새롭게 생성한 salt와 salt를 적용시킨 pw를 저장.. 검증시 salt 불러와 입력받은 패스워드랑 조합해서 db의 pw랑 체크..?	
		logging("password 1= %s", p1);
//		logging("password 2= %s", p2);

		byte[] salt = createSalt();
//		logging("salt: %s", Arrays.toString(salt));

		byte[] d1 = pbkdf2(p1.toCharArray(), salt);
//		byte[] d2 = pbkdf2(p2.toCharArray(), salt);
//		logging("derived 1= %s", Arrays.toString(d1));
//		logging("derived 2= %s", Arrays.toString(d2));

		//test
		System.out.println("salt : " + changeDiget(salt));
		System.out.println("derived : " + changeDiget(d1));
//		System.out.println(changeDiget(changeByte("DD9B497F1A791EE46F566D08EA3760D5ED2E98109A7771856D2A1E97D7354CA6")));
//		System.out.println(changeDiget(pbkdf2(p1.toCharArray(), changeByte("699945A9F164A552236258298CB6F0517638EE374865D5CF6234A5E0DE1033AE"))));
		byte[] d3 = pbkdf2(p1.toCharArray(), changeByte("699945A9F164A552236258298CB6F0517638EE374865D5CF6234A5E0DE1033AE"));
		System.out.println("derived : " + changeDiget(d3));
		System.out.println("check 0 : "	+ authenticate(p1.toCharArray(), d3, changeByte("699945A9F164A552236258298CB6F0517638EE374865D5CF6234A5E0DE1033AE")));
		
		//972C85C975E07EA51462247DC9FCCB519283320BCFD28AD72E09279B7C911C3D

		//검증  - 저장된 salt 키 가져와서 맞춰봐야 되는듯?
//		System.out.println("check 1 : "	+ authenticate(p1.toCharArray(), d1, salt));
//		System.out.println("check 2 : "	+ authenticate(p1.toCharArray(), d2, salt));
	}
}
