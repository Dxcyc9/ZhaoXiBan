package com.xuuxxi.happyold;

import com.xuuxxi.happyold.utils.IatTool;
import org.apache.http.entity.ContentType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/17
 */
public class LatTest {
    public static void main(String args[]) throws IOException {
        IatTool iatTool=new IatTool("0fd5c848");

        File file = new File("/home/xuuxxi/translate_file.pcm");
        FileInputStream fileInputStream = new FileInputStream(file);
        MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
                ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
        System.out.println(iatTool.RecognizePcmfileByte(multipartFile));
    }
}
