import 'package:components/screens/login.dart';
import 'package:components/screens/signup.dart';
import 'package:components/screens/splash.dart';
import 'package:components/utils/drawer.dart';
import 'package:components/utils/tabBar.dart';
import 'package:components/utils/timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dhatnoon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        // primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "nothing",)
    );
  }
}


