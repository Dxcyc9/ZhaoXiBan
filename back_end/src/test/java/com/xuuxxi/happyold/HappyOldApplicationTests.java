package com.xuuxxi.happyold;

import com.xuuxxi.happyold.utils.NameUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HappyOldApplicationTests {
    public static void main(String[] args) {
        String name = "aa.pcm";
        System.out.println(name.substring(0, name.indexOf('.')) + ".com");
    }
}
