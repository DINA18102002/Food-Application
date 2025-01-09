package com.secure;

public class MyDecrypt {
	public static String decrypt(String str) {
        if (str == null || str.isEmpty()) {
            throw new IllegalArgumentException("Input string cannot be null or empty");
        }

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            sb.append((char) (str.charAt(i) - 2)); // Decryption logic
        }
        return sb.toString();
    }
}
