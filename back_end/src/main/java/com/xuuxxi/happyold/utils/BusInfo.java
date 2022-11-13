package com.xuuxxi.happyold.utils;

import org.springframework.web.client.RestTemplate;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/13
 */
public class BusInfo {
    private static RestTemplate restTemplate = new RestTemplate();

    private static final String baseApiUrl = "https://restapi.amap.com/v3/direction/transit/integrated";

    public static String getBusInfo(String origin, String destination, String city) {
        String url = "https://restapi.amap.com/v3/direction/transit/integrated?origin=" + origin + "&destination=" + destination + "&city=" + city + "&key=ca3a7fc40ba0bd55870cdba66e293c4e";
        String json = restTemplate.getForObject(url, String.class);

        return json;
    }
//    public static void main(String[] args) {
//        System.out.println(getBusInfo("116.481028,39.989643", "116.434446,39.90816", "北京"));
//    }
}
