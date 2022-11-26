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

    private static final String myKey = "ca3a7fc40ba0bd55870cdba66e293c4e";

    public static JSONObject getBusInfo(String origin, String destination, String city) {
        String url = "https://restapi.amap.com/v3/geocode/geo?address=" + origin + "&key=" + myKey;
        JSONObject res = JSONObject.parseObject(restTemplate.getForObject(url, String.class));
        origin = res.getJSONArray("geocodes").getJSONObject(0).getString("location");

        url = "https://restapi.amap.com/v3/geocode/geo?address=" + destination + "&key=" + myKey;
        res = JSONObject.parseObject(restTemplate.getForObject(url, String.class));
        destination = res.getJSONArray("geocodes").getJSONObject(0).getString("location");

        url = "https://restapi.amap.com/v3/direction/transit/integrated?origin=" + origin + "&destination=" + destination + "&city=" + city + "&key=" + myKey;

        return restTemplate.getForObject(url, JSONObject.class);
    }
    
    public static JSONObject getPosInfo(String keywords, String city){
        String url = "https://restapi.amap.com/v3/place/text?keywords=" + keywords + "&types=&city=" + city + "&extensions=base" + "&key=" + myKey;

        return restTemplate.getForObject(url, JSONObject.class);
    }
}
