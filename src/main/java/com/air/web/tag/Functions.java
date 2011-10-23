package com.air.web.tag;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * create at: 11-7-11
 *
 * @author Yonghui Chen
 */
public class Functions {
    public static String json(Object vo) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(vo);
        } catch (IOException e) {
            return "";
        }
    }
}
