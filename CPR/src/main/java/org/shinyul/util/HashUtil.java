package org.shinyul.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtil {

	static public String hash(String pw){
		
		MessageDigest message;
		StringBuffer sb = new StringBuffer();
		try {
			message = MessageDigest.getInstance("SHA-512");
//			System.out.println(message.getAlgorithm());
//			message.update(pw.getBytes());
			byte[] tmp = message.digest(pw.getBytes());
			
//			int num = tmp.length;
//			System.out.println(num);
//			System.out.printf("%x\n" ,tmp[0]); 
//			System.out.printf("%s%n", Arrays.toString(tmp));
						
			for(int i = 0; i < tmp.length; i++){
//				System.out.printf("%X" ,tmp[i]); 
				sb.append(String.format("%02X", tmp[i]));
			}
			
//			System.out.println("pw : " + pw + " hash : " + sb.toString());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
	
}
