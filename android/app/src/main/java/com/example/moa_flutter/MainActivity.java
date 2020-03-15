package com.example.moa_flutter;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.GeneratedPluginRegistrant;

import static com.example.moa_flutter.utils.ConferenceUtils.initJitsiMeet;


public class MainActivity extends FlutterActivity {
  private static final String METHOD_CHANNEL = "moa.flutter.io/method";
  private static final String MESSAGE_CHANNEL = "moa.flutter.io/message";

  private static BasicMessageChannel messageChannel = null;

  public static BasicMessageChannel getMessageChannel() {
    return messageChannel;
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    messageChannel = new BasicMessageChannel(getFlutterView(), MESSAGE_CHANNEL, new StandardMessageCodec());
    new MethodChannel(getFlutterView(),METHOD_CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if ("/conference/join".equals(methodCall.method)){
          result.success("success");
        } else {
          result.notImplemented();
        }
      }
    });

    initJitsiMeet();
    GeneratedPluginRegistrant.registerWith(this);
  }


}
