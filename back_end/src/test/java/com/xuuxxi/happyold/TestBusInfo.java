package com.xuuxxi.happyold;

import com.xuuxxi.happyold.utils.BusInfoV2;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/16
 */
public class TestBusInfo {
    public static void main(String[] args) {
        //System.out.println(BusInfo.getBusInfo("福州大学", "福建师范大学", "福州"));
        System.out.println(BusInfoV2.getBusPos("福州市", "NTkxMjAyODQzOTYx", "r53839", "330"));
    }
}
