package com.xuuxxi.happyold.controller;

import com.xuuxxi.happyold.common.R;
import com.xuuxxi.happyold.utils.BusInfo;
import com.xuuxxi.happyold.utils.LunarUtil;
import com.xuuxxi.happyold.utils.PosUtil;
import com.xuuxxi.happyold.utils.WeatherInfo;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Xuuxxi
 * @Date: 2022/10/26
 */
@RestController
@RequestMapping("/utils")
public class UtilsController {
    @GetMapping("/weather/{pos}")
    public R<String> getWeatherInfo(@PathVariable String pos){
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
    public R<String> getBusInfo(@RequestParam String origin, @RequestParam String destination, @RequestParam String city){
        String res = BusInfo.getBusInfo(origin, destination, city);
        return R.success(res);
    }
}
