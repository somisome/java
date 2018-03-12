package kr.or.ddit.utils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

public class CryptoGenerator {
	// 암호화(공개키:PublicKey) , 복호화(비밀키: PrivateKey) 키를 작성(공개키와 비밀키 쌍) 후 Map으로 반환
	// * key는 재사용 될 수 없음
	
	public static Map<String,String> getGeneratorKey(HttpSession session) {
		KeyPairGenerator  generator = null;
		KeyPair keyPair = null;
		KeyFactory keyFactory = null;
		PublicKey publicKey = null;
		PrivateKey privateKey = null;
		
		Map<String, String> publicKeyMap = new HashMap<String, String>();
		
		try {
			//공개키, 비밀키 작성하는 자원에 적용할 암호화 알고리즘을 설정.
			generator = KeyPairGenerator.getInstance("RSA");
			//공개키 작성시의 키의 사이즈(2048바이트 = 2키로바이트)
			generator.initialize(2048);
			//공개키, 비밀키 작성
			keyPair = generator.generateKeyPair();
			publicKey = keyPair.getPublic();
			privateKey = keyPair.getPrivate();
			
			session.setAttribute("privateKey", privateKey);
			
			keyFactory = KeyFactory.getInstance("RSA");
			//클라이언트에 제공될 공개키를 설정된 사이즈와 암호화 알고리즘을 기초로 Double타입의 부호+가수부+지수부로 분리
			//-1456.12345675231 => 1 00010100 10100101010101010101001
			//=> 10001010010100101010101010101001
			//1456.12345675231 => 0 00010100100 10100101010101010101001...52bit
			//																소수점위치		값
			// float(32bit 단정도 비트 처리) : 부호비트(1bit: 양수 0, 음수 1) + 지수부(8bit) + 가수부(23bit)
			// double(64bit 배정도 비트처리) : 부호비트(1bit: 양수 0, 음수 1) + 지수부(11bit) + 가수부(52bit)
			
			RSAPublicKeySpec publicKeySpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			
			//공개키(지수)
			String publicKeyModulus = publicKeySpec.getModulus().toString(16);
			//공개키(가수)
			String publicKeyExponent = publicKeySpec.getPublicExponent().toString(16);
			
			publicKeyMap.put("publicKeyModulus", publicKeyModulus);
			publicKeyMap.put("publicKeyExponent", publicKeyExponent);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return publicKeyMap;
	}
	
	public static String decryptoRSA(HttpSession session, String secureValue){
		PrivateKey privateKey = (PrivateKey) session.getAttribute("privateKey");
		
		String returnValue = "";
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] targetBytes = hexToByteArray(secureValue);
			byte[] beforeString = cipher.doFinal(targetBytes);
			returnValue = new String(beforeString,"UTF-8");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	private static byte[] hexToByteArray(String secureValue){
		if(secureValue==null || secureValue.length()%2!=0 ){
			return new byte[]{};
		}
		byte[] bytes = new byte[secureValue.length()/2];
		for(int i=0; i<secureValue.length(); i+=2){
			byte value = (byte) Integer.parseInt(secureValue.substring(i,i+2),16);
			bytes[(int) Math.floor(i/2)] = value;
		}
		return bytes;
	}
	
	
	
}	
