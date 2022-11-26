package com.xuuxxi.happyold.controller;

import com.alibaba.fastjson.JSONObject;
import com.xuuxxi.happyold.common.R;
import com.xuuxxi.happyold.utils.*;
import org.springframework.web.bind.annotation.*;
import java.util.Calendar;

/**
 * @Author: Xuuxxi
 * @Date: 2022/10/26
 */
@RestController
@RequestMapping("/utils")
public class UtilsController {
    @GetMapping("/weather/{pos}")
    public R<JSONObject> getWeatherInfo(@PathVariable String pos){
        return R.success(WeatherInfo.getWeatherInfo(pos));
    }

    @GetMapping("/lunar")
    public R<String> getLunarInfo() {
        LunarUtil lunarDay = new LunarUtil(Calendar.getInstance());

        return R.success(lunarDay.toString());
    }

    @PostMapping("/posInfo")
    public R<String> getPosInfo(@RequestParam String longitude, @RequestParam String latitude){
        String res = PosUtil.getAddressInfoByLngAndLat(longitude, latitude);
        if(res.contains("addressComponentInfo")) return R.success(res);
        else return R.error(res);
    }

    @PostMapping("/busInfo")
    public R<JSONObject> getBusOldInfo(@RequestParam String origin, @RequestParam String destination, @RequestParam String city){
        return R.success(BusInfo.getBusInfo(origin, destination, city));
    }

    @PostMapping("/getAnsInfo")
    public R<JSONObject> getAnsInfo(@RequestParam String city, @RequestParam String origin, @RequestParam String destination){
        return R.success(BusInfoV2.getAnsInfo(city, origin, destination));
    }

    @PostMapping("/getBusInfo")
    public R<JSONObject> getBusInfo(@RequestParam String city, @RequestParam String keywords){
        return R.success(BusInfoV2.getBusInfo(city, keywords));
    }

    @PostMapping("/getBusPos")
    public R<JSONObject> getBusPos(@RequestParam String city, @RequestParam String busLineId, @RequestParam String busLineNum, @RequestParam String busLineName){
        return R.success(BusInfoV2.getBusPos(city, busLineId, busLineNum, busLineName));
    }

    @PostMapping("/getPosList")
    public R<JSONObject> getPosList(@RequestParam String keywords, @RequestParam String city){
        return R.success(BusInfo.getPosInfo(keywords, city));
    }
}
