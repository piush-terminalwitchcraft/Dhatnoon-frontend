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