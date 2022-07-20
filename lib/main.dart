import 'package:camera/camera.dart';
import 'package:components/deletable/shape.dart';
import 'package:components/screens/login.dart';
import 'package:components/screens/signup.dart';
import 'package:components/screens/splash.dart';
import 'package:components/utils/drawer.dart';
import 'package:components/utils/listWheelScrollView.dart';
import 'package:components/utils/request.dart';
import 'package:components/utils/rivetest.dart';
import 'package:components/utils/smart_accordion.dart';
import 'package:components/utils/tabBar.dart';
import 'package:components/utils/timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// backend
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final cameras = await availableCameras();
  final front_Camera = cameras[1];  // front camera
  final rear_Camera = cameras[0];

  
    // rear camera
  runApp(MyApp());
}

final navigatorkey = GlobalKey<NavigatorState>();

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorkey,
      title: 'Dhatnoon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePage();
            } else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.hasError){
              return Center(child: Text("Something went wrong"));
            }
            else {
              return const LogIn();
            }
          }),
    );
  }
}
