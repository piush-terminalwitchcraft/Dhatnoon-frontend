import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/session_controller.dart';
import 'package:components/utils/tabBar.dart';
import 'package:flutter/material.dart';

class AudioSendStream extends StatefulWidget {
  const AudioSendStream({Key? key}) : super(key: key);

  @override
  State<AudioSendStream> createState() => _AudioSendStreamState();
}

class _AudioSendStreamState extends State<AudioSendStream> {

  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "63a29f76b5704dd0bf01316fc9f8f736",
        channelName: "test",
        tempToken:
            "00663a29f76b5704dd0bf01316fc9f8f736IADLuoEAAeBUGxOcEVMrBNhLrZ5KXUU6vypKiLC460Bx8gx+f9gAAAAAEADYBo2ZTd/8YgEAAQBN3/xi"
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

    Future.delayed(Duration(seconds: 2), () {
      toggleCameraNew(sessionController: _client.sessionController);
    });

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
                  'Audio streaming',
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
                      enableHostControls: true, // Add this to enable host controls
                    ),
                    AgoraVideoButtons(
                        client: _client,
                        autoHideButtons: false,
                        enabledButtons: [
                          BuiltInButtons.callEnd
                        ],
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

  Future<void> toggleCameraNew(
      {required SessionController sessionController}) async {
    var status = await Permission.camera.status;
    if (sessionController.value.isLocalVideoDisabled && status.isDenied) {
      await Permission.camera.request();
    }
    sessionController.value = sessionController.value.copyWith(
        isLocalVideoDisabled: !(sessionController.value.isLocalVideoDisabled));
    await sessionController.value.engine
        ?.muteLocalVideoStream(sessionController.value.isLocalVideoDisabled);
  }
}


class AudioRecieveStream extends StatefulWidget {
  const AudioRecieveStream({Key? key}) : super(key: key);

  @override
  State<AudioRecieveStream> createState() => _AudioRecieveStreamState();
}

class _AudioRecieveStreamState extends State<AudioRecieveStream> {

  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "63a29f76b5704dd0bf01316fc9f8f736",
        channelName: "test",
        tempToken:
            "00663a29f76b5704dd0bf01316fc9f8f736IADLuoEAAeBUGxOcEVMrBNhLrZ5KXUU6vypKiLC460Bx8gx+f9gAAAAAEADYBo2ZTd/8YgEAAQBN3/xi"
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

    Future.delayed(Duration(seconds: 2), () {
      toggleCameraNew(sessionController: _client.sessionController);
    });

    return MaterialApp(
      home: Stack(
        children: [
          Visibility(
            visible: true,
            maintainState: true,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Audio streaming',
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
                        enabledButtons: [
                          BuiltInButtons.callEnd
                        ],
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

  Future<void> toggleCameraNew(
      {required SessionController sessionController}) async {
    var status = await Permission.camera.status;
    if (sessionController.value.isLocalVideoDisabled && status.isDenied) {
      await Permission.camera.request();
    }
    sessionController.value = sessionController.value.copyWith(
        isLocalVideoDisabled: !(sessionController.value.isLocalVideoDisabled));
    await sessionController.value.engine
        ?.muteLocalVideoStream(sessionController.value.isLocalVideoDisabled);
  }
}