package com.xuuxxi.happyold.controller;

import com.xuuxxi.happyold.common.R;
import com.xuuxxi.happyold.dao.MultipartFileDto;
import com.xuuxxi.happyold.utils.IatTool;
import com.xuuxxi.happyold.utils.PcmTransUtil;
import com.xuuxxi.happyold.utils.TextTranslateWithoutSound;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
     *
     * @return
     * @throws IOException
     */
    private String getFileBasePath() throws IOException {
        File file = new File("");

        String path = file.getCanonicalPath() + "\\src\\main\\resources\\templates";

        File dir = new File(path);
        if (!dir.exists()) dir.mkdir();

        return path;
    }

    /**
     * 文件下载
     *
     * @param response
     */
    @GetMapping("/textDownload")
    public void download(HttpServletResponse response) {
        try {
            //String basePath = getFileBasePath();
//            String tarFile = basePath + "\\" + "translate_file.mp3";
//            String srcFile = basePath + "\\" + "translate_file.pcm";
            String tarFile = "/home/xuuxxi/translate_file.mp3";
            String srcFile = "/home/xuuxxi/translate_file.pcm";

            if (!PcmTransUtil.convertAudioFiles(srcFile, tarFile).equals("ok")) return;

            FileInputStream inputStream = new FileInputStream(tarFile);
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("audio/mp3");

            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
                outputStream.flush();
            }

            outputStream.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/textUpload")
    public R<String> upload(@RequestParam String role, @RequestParam String text) {
        TextTranslateWithoutSound.getRes(role, text);
        return R.success("success");
    }

    @PostMapping("/soundDownload")
    public R<String> soundDownload(MultipartFile soundFile) throws IOException {
        IatTool iatTool = new IatTool("0f559cb4");
//        String basePath = "E:\\home\\xuuxxi\\sound_translate_file.pcm";
        String basePath = "/home/xuuxxi/sound_translate_file.pcm";

        try {
            soundFile.transferTo(new File(basePath));
        } catch (IOException e) {
            return R.error(e.toString());
        }

//        File file = new File("E:\\home\\xuuxxi\\sound_translate_file.pcm");
        File file = new File("/home/xuuxxi/sound_translate_file.pcm");
        FileInputStream fileInputStream = new FileInputStream(file);
        MultipartFile multipartFile = new MultipartFileDto(file.getName(), file.getName(),
                ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
        return R.success(iatTool.RecognizePcmfileByte(multipartFile));
    }
}
