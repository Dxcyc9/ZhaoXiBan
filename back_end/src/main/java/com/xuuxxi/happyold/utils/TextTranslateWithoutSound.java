package com.xuuxxi.happyold.utils;

import com.iflytek.cloud.speech.*;

/**
 * @Author: Xuuxxi
 * @Date: 2022/10/23
 */
public class TextTranslateWithoutSound {
    //41212f90
    private static final String appId = "0f559cb4";
    public static void getRes(String role, String text) {
        System.out.println(role + " : " + text);
        SpeechUtility.createUtility( SpeechConstant.APPID +"=" + appId + " ");
        SpeechSynthesizer speechSynthesizer = SpeechSynthesizer
                .createSynthesizer();
        // 设置发音人
        speechSynthesizer.setParameter(SpeechConstant.VOICE_NAME, role);

        //启用合成音频流事件，不需要时，不用设置此参数
        speechSynthesizer.setParameter( SpeechConstant.TTS_BUFFER_EVENT, "1" );
        // 设置合成音频保存位置（可自定义保存位置），默认不保存
//        speechSynthesizer.synthesizeToUri(text, "./src/main/resources/templates/translate_file.pcm",
//                synthesizeToUriListener);

        speechSynthesizer.synthesizeToUri(text, "/home/xuuxxi/translate_file.pcm",
                synthesizeToUriListener);

//        speechSynthesizer.setParameter(SpeechConstant.TTS_AUDIO_PATH, "./src/main/resources/templates/translate_file.pcm");

        speechSynthesizer.setParameter(SpeechConstant.TTS_AUDIO_PATH, "/home/xuuxxi/translate_file.pcm");
    }

    /**
     * 合成监听器
     */
    static SynthesizeToUriListener synthesizeToUriListener = new SynthesizeToUriListener() {

        public void onBufferProgress(int progress) {}

        public void onSynthesizeCompleted(String uri, SpeechError error) {}

        @Override
        public void onEvent(int eventType, int arg1, int arg2, int arg3, Object obj1, Object obj2) {}

    };
}
