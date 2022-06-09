import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:components/screens/login.dart';
import 'package:components/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _shape = const StadiumBorder();
    // final double width = MediaQuery.of(context).size.width - 50;
    // final double height = MediaQuery.of(context).size.height / 2 - 100;

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "assets/splash2.jpeg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Logo(),
        LogoName(),
        ElasticInUp(
          delay: const Duration(seconds: 2),
          duration: const Duration(seconds: 3),
          animate: true,
          child: Align(
            alignment: const Alignment(0.0, 0.9),
            child: GlassContainer(
              alignment: const Alignment(0.0, 0.0),
              width: 350,
              height: 250,
              color: Colors.white,
              colorOpacity: 0.3,
              blurStrengthX: 100,
              blurStrengthY: 100,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
              border: Border.all(width: 3, color: Colors.white30),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  FadeInLeft(
                    delay: const Duration(seconds: 3),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 60),
                        elevation: 20,
                        shadowColor: Colors.white30,
                      ),
                      onPressed: ()=> Get.to(const Login(),transition: Transition.downToUp, duration: Duration(milliseconds: 400)),
                      child: const Text("Log In",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.white,
                    indent: 70,
                    endIndent: 70,
                  ),
                  const SizedBox(height: 20),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 3500),
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: _shape,
                          gradient: const LinearGradient(
                              colors: [Color(0xff4b37bc), Color(0xfff272fa)])),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            elevation: 20,
                            shadowColor: Colors.white30,
                            fixedSize: const Size(300, 60),
                            primary: Colors.transparent),
                        onPressed: () => Get.to(const Register(), transition: Transition.downToUp, duration: Duration(milliseconds: 400)),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) // Align
      ]),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Logo() {
  return JelloIn(
    duration: const Duration(seconds: 2),
    child: Align(
      alignment: const Alignment(0.0, -0.5),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Text("Logo"),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget LogoName() {
  return JelloIn(
    delay: const Duration(seconds: 2),
    duration: const Duration(seconds: 2),
    child: const Align(
      alignment: Alignment(0.0, -0.2),
      child: Text(
        "Dhatnoon",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    ),
  );
}
