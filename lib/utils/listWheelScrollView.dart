import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D List"),
      ),
      backgroundColor: Colors.black,
      body: ListWheelScrollView.useDelegate(
        itemExtent: 80,
        squeeze: 0.8,
        perspective: 0.009,
        // diameterRatio: 1.0,
        // magnification: 1.5,
        // overAndUnderCenterOpacity: 1,
        offAxisFraction: -1.5,
        // useMagnifier: true,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (i) => print("Changed $i"),
        renderChildrenOutsideViewport: false,
        //squeeze: 1.5,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.lightBlueAccent,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    spreadRadius: 0.5,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 13, 69, 154),
                  Colors.blue.shade700,
                  Colors.blue.shade500,
                  Colors.blue.shade300,
                  Colors.blue.shade100
                ]),
              ),
              width: MediaQuery.of(context).size.width - 280,
              child: Center(
                child: ListTile(
                  title: Text(" "),
                  trailing: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
