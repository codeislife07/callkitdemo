import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Call Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            //show miss call notification
            ElevatedButton(onPressed: ()async{
              CallKitParams params=CallKitParams(
                id: "12",
                nameCaller: "Coding Is Life",
                handle: "1234567890",
                type: 1,
                textMissedCall: "Missed call",
                textCallback: "Call Back",
                extra: {"userId":"1234fg"}
              );
              await FlutterCallkitIncoming.showMissCallNotification(params);
            }, child: Text("Missed call")),
            SizedBox(height: 20,),
            //outgoing call

            ElevatedButton(onPressed: ()async{
            try{
              CallKitParams params=CallKitParams(
                id: "12dgv",
                nameCaller: "Coding Is Life",
                handle: "1234567890",
                type: 1,
                ios: IOSParams(handleType: 'generic'),
                extra: {"userId":"1234fg"},
              );
              await FlutterCallkitIncoming.startCall(params);
            }catch(e){
              print("EXCE=====$e");
            }
            }, child: Text("OutGoing")),
            //we will check it latter
            SizedBox(height: 20,),
            //incoming call
            ElevatedButton(onPressed: ()async{
              CallKitParams params=CallKitParams(
                id: "21232dgfgbcbgb",
                nameCaller: "Coding Is Life",
                appName: "Demo",
                avatar: "https://i.pravata.cc/100",
                handle: "123456",
                type: 0,
                textAccept: "Accept",
                textDecline: "Decline",
                textMissedCall: "Missed call",
                textCallback: "Call back",
                duration: 30000,
                extra: {'userId':"sdhsjjfhuwhf"},
                android: AndroidParams(
                  isCustomNotification: true,
                  isShowLogo: false,
                  isShowCallback: false,
                  isShowMissedCallNotification: true,
                  ringtonePath: 'system_ringtone_default',
                  backgroundColor: "#0955fa",
                  backgroundUrl: "https://i.pravata.cc/500",
                  actionColor: "#4CAF50",
                  incomingCallNotificationChannelName: "Incoming call",
                  missedCallNotificationChannelName: "Missed call"
                ),
                ios: IOSParams(
                  iconName: "Call Demo",
                  handleType: 'generic',
                  supportsVideo: true,
                  maximumCallGroups: 2,
                  maximumCallsPerCallGroup: 1,
                  audioSessionMode: 'default',
                  audioSessionActive: true,
                  audioSessionPreferredSampleRate: 44100.0,
                  audioSessionPreferredIOBufferDuration: 0.005,
                  supportsDTMF: true,
                  supportsHolding: true,
                  supportsGrouping: false,
                  ringtonePath: 'system_ringtone_default'
                )
              );
              await FlutterCallkitIncoming.showCallkitIncoming(params);
            }, child: Text("Incoming"))
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
