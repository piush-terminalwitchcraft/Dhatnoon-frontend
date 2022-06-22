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
        title: const Text("Select your choice"),
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
        centerTitle: true,
      ),
      backgroundColor: Color(0xffcfd8dc),
      body: ListWheelScrollView.useDelegate(
        squeeze: 0.8,
        itemExtent: 100,
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
                    color: Color(0xff270745),
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    spreadRadius: 0.5,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Color(0xff270745),
                  Color(0xff250543),
                  Color(0xff170036),
                  Color(0xff120032),
                  Color(0xff120032),
                ]),
              ),
              width: MediaQuery.of(context).size.width - 100,
              child: Center(
                child: ListTile(
                  title: Text(
                    _items[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: _icons[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> _items = [
  "Live Geo Location",
  "Front Camera Pic",
  "Back Camera Pic",
  "Front Camera Streaming",
  "Back Camera Streaming",
  "Front Camera 10 second video",
  "Back Camera 10 second video",
  "Audio Live Streaming",
  "10 second Audio recording"
];

List<Icon> _icons = [
  Icon(Icons.location_on_outlined, color: Colors.white),
  Icon(Icons.camera_front_outlined, color: Colors.white),
  Icon(Icons.camera_rear_outlined, color: Colors.white),
  Icon(Icons.photo_camera_front_outlined, color: Colors.white),
  Icon(Icons.photo_camera_back_outlined, color: Colors.white),
  Icon(Icons.video_camera_front_outlined, color: Colors.white),
  Icon(Icons.video_camera_back_outlined, color: Colors.white),
  Icon(Icons.audio_file_sharp, color: Colors.white),
  Icon(Icons.record_voice_over_outlined, color: Colors.white),
];
