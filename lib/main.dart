import 'package:flutter/material.dart';
import 'package:moa_flutter/utils/native_platform.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NativeConferencePlatform.messageChannel.setMessageHandler(_messageHandler);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[800],
        appBarTheme: AppBarTheme()
      ),
      home: Scaffold(
        appBar:  AppBar(
          title:Text('JitsiMeetFlutterDemo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            RaisedButton(
              child: Text('打开JitsiMeet会议'),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  var conferenceOption = {
                    'room': _controller.text,
                    'video': true,
                    'audio': true,
                  } ;
                  NativeConferencePlatform.join(conferenceOption);
                }
              },
            )
          ],
        )
      ),
    );
  }

  Future<dynamic> _messageHandler(dynamic message) async{
    debugPrint('$message');
    return 'flutter.reply';
  }

}
