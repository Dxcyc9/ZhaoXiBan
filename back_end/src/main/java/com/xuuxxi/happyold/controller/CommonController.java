package com.xuuxxi.happyold.controller;

import com.xuuxxi.happyold.common.R;
import com.xuuxxi.happyold.utils.PcmTransUtil;
import com.xuuxxi.happyold.utils.TextTranslateWithoutSound;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * @Author: Xuuxxi
 * @Date: 2022/5/8
 */

@Slf4j
@RequestMapping("/common")
@RestController
public class CommonController {
    /**
     * 动态获取路径
     * @return
     * @throws IOException
     */
    private String getFileBasePath() throws IOException {
        File file = new File("");

        String path = file.getCanonicalPath() + "\\src\\main\\resources\\templates";

        File dir = new File(path);
        if(!dir.exists()) dir.mkdir();

        return path;
    }

    /**
     * 文件下载
     * @param response
     */
    @GetMapping("/download")
    public void download(HttpServletResponse response){
        try{
            //String basePath = getFileBasePath();
//            String tarFile = basePath + "\\" + "translate_file.mp3";
//            String srcFile = basePath + "\\" + "translate_file.pcm";
            String tarFile = System.getProperties().getProperty("user.home") +  File.separator + "translate_file.mp3";
            String srcFile = System.getProperties().getProperty("user.home") +  File.separator + "translate_file.pcm";

            if(!PcmTransUtil.convertAudioFiles(srcFile, tarFile).equals("ok")) return;

            FileInputStream inputStream = new FileInputStream(tarFile);
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("audio/mp3");

            int len = 0;
            byte[] bytes = new byte[1024];
            while((len = inputStream.read(bytes)) != -1){
                outputStream.write(bytes,0,len);
                outputStream.flush();
            }

            outputStream.close();
            inputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @GetMapping("/upload")
    public R<String> upload(@RequestParam String role, @RequestParam String text){
        TextTranslateWithoutSound.getRes(role, text);
        return R.success("success");
    }
}
