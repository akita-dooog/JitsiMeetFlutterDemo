import 'package:flutter/services.dart';

class  NativeConferencePlatform{
  static const methodChannel = const MethodChannel('moa.flutter.io/method');

  static join(var conferenceOption){
    methodChannel.invokeMethod("/conference/join",conferenceOption);
  }

  static const messageChannel = const BasicMessageChannel('moa.flutter.io/message', StandardMessageCodec());
}
