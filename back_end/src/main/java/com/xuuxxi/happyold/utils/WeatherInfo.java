package com.xuuxxi.happyold.utils;

import org.springframework.web.client.RestTemplate;

/**
 * @Author: Xuuxxi
 * @Date: 2022/10/23
 */
public class WeatherInfo {
    private static RestTemplate restTemplate = new RestTemplate();

    private static final String baseApiUrl = "https://restapi.amap.com/v3/weather/weatherInfo";

    public static String getWeatherInfo(String pos){
        String url = "https://restapi.amap.com/v3/weather/weatherInfo?key=ca3a7fc40ba0bd55870cdba66e293c4e&city=" + pos + "&extensions=all";
        String json = restTemplate.getForObject(url, String.class);

        return json;
    }
}
