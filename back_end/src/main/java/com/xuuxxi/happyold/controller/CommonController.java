package com.xuuxxi.happyold.controller;

import com.xuuxxi.happyold.common.R;
import com.xuuxxi.happyold.dao.MultipartFileDto;
import com.xuuxxi.happyold.dao.TextInfo;
import com.xuuxxi.happyold.utils.*;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
     * 文件下载
     *
     * @param response
     */
    @GetMapping("/textDownload/{fileName}")
    public void textDownload(HttpServletResponse response, @PathVariable String fileName) throws IOException {
//        String bathPath = "/home/xuuxxi/transFile/";
        String tarFile = "/home/xuuxxi/transFile/" + fileName.substring(0, fileName.indexOf('.')) + ".mp3";
        File f = new File(tarFile);

        FileInputStream inputStream = new FileInputStream(f);
        response.setContentType("audio/mp3");
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.flush();


        int len;
        byte[] bytes = new byte[1024];
        while ((len = inputStream.read(bytes)) != -1) {outputStream.write(bytes, 0, len);}

        outputStream.close();
        outputStream.flush();
        inputStream.close();
    }

    @PostMapping("/textUpload")
    public R<String> textUpload(@RequestBody TextInfo info) throws InterruptedException {
        String fileName = TextTranslateWithoutSound.getRes(info.getRole(), info.getText());
        Thread.sleep(2000);

        String bathPath = "/home/xuuxxi/transFile/";
        String srcFile = bathPath + fileName;
        String tarFile = bathPath + fileName.substring(0, fileName.indexOf('.')) + ".mp3";

        if (!PcmTransUtil.convertAudioFiles(srcFile, tarFile).equals("ok")) return R.error("translate mp3 error");

        return R.success(fileName);
    }

    @PostMapping("/soundDownload")
    public R<String> soundDownload(MultipartFile soundFile) throws IOException {
        IatTool iatTool = new IatTool("0f559cb4");

        String newName = NameUtil.getNewName("sound_translate_file.pcm");
//        String basePath = "E:\\home\\xuuxxi\\sound_translate_file.pcm";
        String basePath = "/home/xuuxxi/transFile/" + newName;

        try {
            soundFile.transferTo(new File(basePath));
        } catch (IOException e) {
            return R.error(e.toString());
        }

//        File file = new File("E:\\home\\xuuxxi\\sound_translate_file.pcm");
        File file = new File("/home/xuuxxi/transFile/" + newName);
        FileInputStream fileInputStream = new FileInputStream(file);
        MultipartFile multipartFile = new MultipartFileDto(file.getName(), file.getName(),
                ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
        return R.success(iatTool.RecognizePcmfileByte(multipartFile));
    }
}
