import 'package:flutter/material.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _progress;

  bool isIndex0 = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            // call `build` on animation progress
            setState(() {});
          });

    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (_isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
        ),
        appBar: AppBar(
          actions: [Icon(Icons.more_vert_outlined)],
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff270745),
              Color(0xff250543),
              Color(0xff170036),
              Color(0xff120032),
              Color(0xff120032),
            ])),
          ),
          toolbarHeight: 75,
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          bottom: TabBar(
            onTap: (value) {
              if (value == 0) {
                setState(() {
                  isIndex0 = true;
                });
              } else {
                setState(() {
                  isIndex0 = false;
                });
              }
              animate();
            },
            tabs: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: isIndex0 ? Color(0xffd33361) : Colors.transparent,
                      offset: Offset(0.0, 65),
                      blurRadius: 40,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: isIndex0 ? Colors.black : Colors.transparent,
                      offset: Offset(0.0, 120),
                      blurRadius: 7,
                      spreadRadius: 35,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Tab(
                      icon: SimpleAnimatedIcon(
                        startIcon: Icons.cloud_download_sharp,
                        endIcon: Icons.refresh,
                        progress: _progress,
                        transitions: [
                          Transitions.rotate_ccw,
                          Transitions.zoom_in,
                        ],
                      ),
                      text: "Fetch"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: isIndex0 ? Colors.transparent : Color(0xffd33361),
                      offset: Offset(0.0, 65),
                      blurRadius: 40,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: isIndex0 ? Colors.transparent : Colors.black,
                      offset: Offset(0.0, 120),
                      blurRadius: 7,
                      spreadRadius: 35,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Tab(
                    icon: SimpleAnimatedIcon(
                      startIcon: Icons.hourglass_empty,
                      endIcon: Icons.check_circle_outline,
                      progress: _progress,
                      transitions: [
                        Transitions.zoom_in,
                        Transitions.rotate_ccw
                      ],
                    ),
                    text: "Allow",
                  ),
                ),
              ),
            ],
            labelColor: Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: Color.fromARGB(255, 92, 91, 91),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: MaterialIndicator(
              color: Color(0xffd33361),
              height: 5,
              topLeftRadius: 0,
              topRightRadius: 0,
              bottomLeftRadius: 6,
              bottomRightRadius: 6,
              tabPosition: TabPosition.bottom,
            ),
          ),
          title: Text("Hello - 9932145671"),
          // backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.black,
              child: Text("1"),
            ),
            Container(
              color: Colors.black,
              child: Text("2"),
            )
          ],
        ),
      ),
    );
  }
}
