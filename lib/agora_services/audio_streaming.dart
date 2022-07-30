import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
// Import package
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioStreaming extends StatefulWidget {
  var documentID;

  AudioStreaming({Key? key, required this.documentID}) : super(key: key);

  @override
  State<AudioStreaming> createState() => _AudioStreamingState();
}

class _AudioStreamingState extends State<AudioStreaming> {
  @override
  Widget build (BuildContext context){
    return Material();
  }
  
}