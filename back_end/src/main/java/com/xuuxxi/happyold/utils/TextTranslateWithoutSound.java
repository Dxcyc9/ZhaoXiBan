package com.xuuxxi.happyold.utils;

import com.iflytek.cloud.speech.*;

/**
 * @Author: Xuuxxi
 * @Date: 2022/10/23
 */
public class TextTranslateWithoutSound {
    public static void getRes(String role, String text) {
        SpeechUtility.createUtility( SpeechConstant.APPID +"=0fd5c848 ");
        SpeechSynthesizer speechSynthesizer = SpeechSynthesizer
                .createSynthesizer();
        // 设置发音人
        speechSynthesizer.setParameter(SpeechConstant.VOICE_NAME, role);

        //启用合成音频流事件，不需要时，不用设置此参数
        speechSynthesizer.setParameter( SpeechConstant.TTS_BUFFER_EVENT, "1" );
        // 设置合成音频保存位置（可自定义保存位置），默认不保存
        speechSynthesizer.synthesizeToUri(text, "./translate_file.pcm",
                synthesizeToUriListener);

        speechSynthesizer.setParameter(SpeechConstant.TTS_AUDIO_PATH, "./translate_file.pcm");
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
