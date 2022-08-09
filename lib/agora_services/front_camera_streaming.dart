import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/session_controller.dart';
import 'package:components/utils/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class FrontSendStream extends StatefulWidget {
  const FrontSendStream({
    Key? key,
  }) : super(key: key);

  @override
  State<FrontSendStream> createState() => _FrontSendStreamState();
}

class _FrontSendStreamState extends State<FrontSendStream> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "63a29f76b5704dd0bf01316fc9f8f736",
      channelName: "test",
      tempToken:
          "00663a29f76b5704dd0bf01316fc9f8f736IABEIQx/N9ObwJd03RWAfv1ktuOE/rn+6ffUklp23cWfzAx+f9gAAAAAEABUJOp9oEHqYgEAAQCfQepi",
      // username: "user",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await _client.initialize();
  }

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          MyHomePage(),
          Visibility(
            visible: false,
            maintainState: true,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Front camera streaming',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff270745),
                        Color(0xff250543),
                        Color(0xff170036),
                        Color(0xff120032),
                        Color(0xff120032),
                      ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    AgoraVideoViewer(
                      client: _client,
                      layoutType: Layout.floating,
                      enableHostControls:
                          true, // Add this to enable host controls
                    ),
                    AgoraVideoButtons(
                      client: _client,
                      autoHideButtons: false,
                      enabledButtons: [BuiltInButtons.callEnd],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FrontReciverStream extends StatefulWidget {
  const FrontReciverStream({
    Key? key,
  }) : super(key: key);

  @override
  State<FrontReciverStream> createState() => _FrontReciverStreamState();
}

class _FrontReciverStreamState extends State<FrontReciverStream> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "63a29f76b5704dd0bf01316fc9f8f736",
      channelName: "test",
      tempToken:
          "00663a29f76b5704dd0bf01316fc9f8f736IABEIQx/N9ObwJd03RWAfv1ktuOE/rn+6ffUklp23cWfzAx+f9gAAAAAEABUJOp9oEHqYgEAAQCfQepi",
      // username: "user",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await _client.initialize();
  }

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Stack(
        children: [
          Visibility(
            visible: true,
            maintainState: true,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Front camera streaming',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff270745),
                        Color(0xff250543),
                        Color(0xff170036),
                        Color(0xff120032),
                        Color(0xff120032),
                      ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    AgoraVideoViewer(
                      client: _client,
                      layoutType: Layout.floating,
                      enableHostControls: false,
                        floatingLayoutContainerHeight: height - 88,
                        floatingLayoutContainerWidth: width, // Add this to enable host controls
                    ),
                    AgoraVideoButtons(
                      client: _client,
                      autoHideButtons: false,
                      enabledButtons: [BuiltInButtons.callEnd],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


// class FrontPic extends StatefulWidget {
//   FrontPic({Key? key}) : super(key: key);

//   @override
//   State<FrontPic> createState() => _FrontPicState();
// }

// class _FrontPicState extends State<FrontPic> {
//   String tempToken = "";
//   @override
//   void initState() {
//     super.initState();
//     getToken();
//   }

//   getToken() async {
//     String link =
//         "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=test";

//     Response _response = await get(Uri.parse(link));
//     Map data = jsonDecode(_response.body);
//     setState(() {
//       tempToken = data["token"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FrontSendStream(permanentToken: tempToken);
//   }
// }