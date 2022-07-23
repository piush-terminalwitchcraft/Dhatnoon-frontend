import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:components/services/photo_page.dart';
import 'package:components/utils/tabBar.dart';
import 'package:flutter/material.dart';

class FrontCameraPic extends StatefulWidget {
  @override
  FrontCameraPicState createState() => FrontCameraPicState();
      
}

class FrontCameraPicState extends State<FrontCameraPic> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    startEverything();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  startEverything() async {
    final cameras = await availableCameras();
    final frontCamera = cameras[1];

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    takeThePhoto();
  }

  takeThePhoto() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      if (!mounted) return;

      // If the picture was taken, display it on a new screen.
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
            cameraMode: 'front',
          ),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}
