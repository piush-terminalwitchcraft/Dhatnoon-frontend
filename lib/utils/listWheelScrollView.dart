import 'package:flutter/material.dart';

class ListWheel extends StatefulWidget {
  ListWheel({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ListWheelState createState() => _ListWheelState();
}

class _ListWheelState extends State<ListWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D List"),
      ),
      backgroundColor: Colors.black,
      body: ListWheelScrollView.useDelegate(
        squeeze: 0.8,
        itemExtent: 150,
        diameterRatio: 3.0,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (i) => print("Changed $i"),
        renderChildrenOutsideViewport: false,
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
              width: MediaQuery.of(context).size.width - 100,
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
