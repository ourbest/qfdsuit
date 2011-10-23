package com.pt.base.util;

/**
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-14
 */
public class ByteUtils {
    public static String toHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            if (b >= 0 && b < 0x10) {
                builder.append(0);
            }
            builder.append(Integer.toHexString(b & 0xff));
        }
        return builder.toString();
    }

    public static byte[] toBin(String hexString) {
        if (hexString.length() % 2 != 0) {
            hexString = "0" + hexString;
        }
        int len = hexString.length();
        byte[] result = new byte[len / 2];
        for (int i = 0; i < len; i++) {
            char c = hexString.charAt(i);
            int offset = i >> 1;
            int val = Character.digit(c, 16);
            if (val == -1) {
                throw new IllegalArgumentException("hex string format error - " + c);
            }
            if (i % 2 == 0) {
                result[offset] += (byte) (val << 4);
            } else {
                result[offset] += val;
            }
        }
        return result;
    }
}
