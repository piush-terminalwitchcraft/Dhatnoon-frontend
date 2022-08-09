
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart' as AP;


class AudioPlayer extends StatefulWidget {
  var documentID;
  AudioPlayer({Key? key, required this.documentID}) : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {

  AP.AudioPlayer audioplayer = AP.AudioPlayer();
  bool isPlaying = false;
  Duration audioTime = Duration.zero;
  Duration totalTime = Duration.zero;
  FirebaseStorage storage = FirebaseStorage.instance;
  String audioFileURL = "";

  
  @override 
  void initState() {
    super.initState();
    audioplayer = AP.AudioPlayer();
  }

  @override
  void dispose(){
    audioplayer.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return 
         Material(
          child: Column(
              children: [
                SizedBox(height: 12,),
                // Slider(
                //   min: 0,
                //   max: totalTime.inSeconds.toDouble(),
                //   value: audioTime.inSeconds.toDouble(),
                //   onChanged:((value) async {
                //     await audioplayer.seek(Duration(seconds: value.toInt()));
                //   }),
                // ),
                // SizedBox(height: 12,),
                CircleAvatar(
                  radius: 40,
                  child: IconButton( 
                    icon: Icon(isPlaying? Icons.pause:Icons.play_arrow , size: 50,), 
                    iconSize: 50,
                    onPressed: () async{
                      if(isPlaying == true) {
                        audioplayer.pause(); 
                        setState(() {
                          isPlaying = false;
                        });
                        }
                      else {
                        if(audioFileURL==""){
                          FirebaseStorage storage = FirebaseStorage.instance;
                          Reference ref = storage.ref().child(widget.documentID);
                          audioFileURL = await ref.getDownloadURL();
                        setState(() {
                          isPlaying = true;
                        });
                        }
                        audioplayer.play(AP.UrlSource(audioFileURL));
                      }
                    },  
                      ),
                )
              ],
          ),
        );
     
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPro extends StatefulWidget {
  AudioPlayerPro({required this.audioURL});

  final String audioURL;
  @override
  _AudioPlayerProSetup createState() => _AudioPlayerProSetup();
}

class _AudioPlayerProSetup extends State<AudioPlayerPro> {
  bool isHeartPressed = false;
  bool isPlayPressed = false;
  // double _value = 0;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    // ignore: deprecated_member_use
    // advancedPlayer.durationHandler = (d) => setState(() => _duration = d);
    advancedPlayer.onDurationChanged
        .listen((d) => setState(() => _duration = d));
    // ignore: deprecated_member_use
    // advancedPlayer.positionHandler = (p) => setState(() => _position = p);
    advancedPlayer.onPositionChanged
        .listen((p) => setState(() => _position = p));
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xff270745),
              Color(0xff250543),
              Color(0xff170036),
              Color(0xff120032),
              Color(0xff120032),
            ],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "From : 9876543721",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "ProximaNova",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 0.2,
                          ),
                        ),
                        Text(
                          "audio",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: "ProximaNovaThin",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade600,
                        activeTickMarkColor: Colors.white,
                        thumbColor: Colors.white,
                        trackHeight: 3,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 4,
                        ),
                      ),
                      child: Slider(
                        value: (_position.inSeconds.toDouble() !=
                                _duration.inSeconds.toDouble())
                            ? _position.inSeconds.toDouble()
                            : setChanged(),
                        min: 0,
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            seekToSecond(value.toInt());
                            value = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: "ProximaNovaThin",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: "ProximaNovaThin",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 22, right: 22),
                width: double.infinity,
                child: Container(
                  height: 90,
                  width: 90,
                  child: Center(
                    child: IconButton(
                      iconSize: 70,
                      alignment: Alignment.center,
                      icon: (isPlayPressed == true)
                          ? Icon(
                              Icons.pause_circle_filled,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.play_circle_filled,
                              color: Colors.white,
                            ),
                      onPressed: () {
                        setState(() {
                          isPlayPressed = isPlayPressed == false ? true : false;
                          if (isPlayPressed == true) {
                            print("Playing .....");
                            advancedPlayer.play(UrlSource(widget.audioURL));
                          } else {
                            print("Paused .....");
                            advancedPlayer.pause();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

