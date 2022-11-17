package com.xuuxxi.happyold.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.client.RestTemplate;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/13
 */
public class BusInfo {
    private static final RestTemplate restTemplate = new RestTemplate();

    private static final String baseApiUrl = "https://restapi.amap.com/v3/direction/transit/integrated";

    public static JSONObject getBusInfo(String origin, String destination, String city) {
        String url = "https://restapi.amap.com/v3/geocode/geo?address=" + origin + "&key=ca3a7fc40ba0bd55870cdba66e293c4e";
        JSONObject res = JSONObject.parseObject(restTemplate.getForObject(url, String.class));
        origin = res.getJSONArray("geocodes").getJSONObject(0).getString("location");

        url = "https://restapi.amap.com/v3/geocode/geo?address=" + destination + "&key=ca3a7fc40ba0bd55870cdba66e293c4e";
        res = JSONObject.parseObject(restTemplate.getForObject(url, String.class));
        destination = res.getJSONArray("geocodes").getJSONObject(0).getString("location");

        url = "https://restapi.amap.com/v3/direction/transit/integrated?origin=" + origin + "&destination=" + destination + "&city=" + city + "&key=ca3a7fc40ba0bd55870cdba66e293c4e";

        return restTemplate.getForObject(url, JSONObject.class);
    }
}
