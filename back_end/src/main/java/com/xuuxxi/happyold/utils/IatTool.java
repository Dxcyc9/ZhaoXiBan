package com.xuuxxi.happyold.utils;

import com.iflytek.cloud.speech.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/17
 */
public class IatTool {
    private static Logger LOGGER = LoggerFactory.getLogger(IatTool.class);

    private StringBuilder curRet;

    private SpeechRecognizer recognizer;

    private Object lock = new Object();

    public IatTool(String appId){
        LOGGER.info("------Speech Utility init iat------");
        SpeechUtility.createUtility(SpeechConstant.APPID + "=" + appId);
    }

    public String RecognizePcmfileByte(MultipartFile audioFile) {

        curRet = new StringBuilder();

        try {
            if (recognizer == null) {
                //以下设置转换参数
                recognizer = SpeechRecognizer.createRecognizer();
                recognizer.setParameter(SpeechConstant.AUDIO_SOURCE, "-1");
                recognizer.setParameter( SpeechConstant.RESULT_TYPE, "plain" );
                recognizer.setParameter(SpeechConstant.VAD_BOS,"5000");//前端点超时，
                recognizer.setParameter(SpeechConstant.VAD_EOS,"10000");//后端点超时要与运行SDK时配置的一样
            }

            recognizer.startListening(recListener);

            byte[] buffer = audioFile.getBytes();
            if (buffer == null || buffer.length == 0) {
                LOGGER.error("no audio avaible!");
                recognizer.cancel();
            } else {

                int lenRead = buffer.length;
                System.out.println("文件长度"+buffer.length);
                recognizer.writeAudio( buffer, 0, lenRead );
                recognizer.stopListening();
                synchronized (lock) {
                    lock.wait();//主线程等待
                }
                //System.out.println(curRet.toString());
                return curRet.toString();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    private RecognizerListener recListener = new RecognizerListener() {
        @Override
        public void onBeginOfSpeech() {
            LOGGER.info( "onBeginOfSpeech enter" );
        }
        @Override
        public void onEndOfSpeech() {
            LOGGER.info( "onEndOfSpeech enter" );
        }
        /**
         * 获取听写结果
         */
        @Override
        public void onResult(RecognizerResult results, boolean islast) {
            LOGGER.info( "onResult enter" );
//可以用json解析器解析为json格式，，参考AsrSpeechView中inResult函数
            String text = results.getResultString();
            curRet.append(text);
            //System.out.println("解析结果"+curRet.toString());
            if( islast ) {
                synchronized (lock) {
                    lock.notify();//子线程唤醒
                }
            }
        }
        @Override
        public void onVolumeChanged(int volume) {
            LOGGER.info( "onVolumeChanged volume=" + volume);
        }

        @Override
        public void onError(SpeechError error) {
            LOGGER.error( "onError enter" );
            if (null != error) {
                LOGGER.error("onError Code：" + error.getErrorCode() + "," + error.getErrorDescription(true));
            }
        }
        @Override
        public void onEvent(int eventType, int arg1, int agr2, String msg) {
            LOGGER.info( "onEvent enter" );
            //以下代码用于调试，如果出现问题可以将sid提供给讯飞开发者，用于问题定位排查
			/*if(eventType == SpeechEvent.EVENT_SESSION_ID) {
				DebugLog.Log("sid=="+msg);
			}*/
        }
    };
}
