import 'package:bouncy_widget/bouncy_widget.dart';
import 'package:components/screens/login.dart';
import 'package:components/screens/profile.dart';
import 'package:components/screens/signup.dart';
import 'package:components/screens/splash.dart';
import 'package:components/utils/drawer.dart';
import 'package:components/utils/listWheelScrollView.dart';
import 'package:components/utils/request.dart';
import 'package:components/utils/smart_accordion.dart';
import 'package:components/utils/timepicker.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:popup_card/popup_card.dart';

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

  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
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

  // Initialize index of drawer item
  int index = 0;

  // list of custom drawer items
  final List<DrawerItem> _drawerItems = const <DrawerItem>[
    DrawerItem(icon: Icon(Icons.home_outlined), label: "Home"),
    DrawerItem(icon: Icon(Icons.person_outline_rounded), label: "Profile"),
    DrawerItem(icon: Icon(Icons.logout_rounded), label: "Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: VisibilityDetector(
          key: const Key('my-widget-key'),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;

            // if drawer not opened then route to specific pages based
            // on the index value
            // if (visiblePercentage == 0) {
            //   if (index == 0) Get.to(MyHomePage(title: "title"));
            //   if (index == 1) Get.to(const ProfilePage());
            //   if (index == 2) Get.to(const SplashScreen());
            // }
          },
          // Actual drawer implementation
          child: CurvedDrawer(
            index: index,
            width: 65,
            color: Colors.purple.shade200,
            buttonBackgroundColor: Color(0xff831d8a),
            labelColor: Colors.white,
            items: _drawerItems,
            onTap: (newIndex) {
              setState(() {
                index = newIndex;
              });
            },
          ),
        ),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: "Request",
                  textConfirm: "Send",
                  confirmTextColor: Colors.white,
                  textCancel: "Back",
                  content: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: "Phone number",
                              fillColor: Colors.white70),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => Get.to(ListWheel()),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                            child: Text("Select your choice"),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            showPicker(
                              elevation: 20,
                              blurredBackground: true,
                              borderRadius: 50,
                              context: context,
                              value: _time,
                              onChange: onTimeChanged,
                              minuteInterval: MinuteInterval.FIVE,
                              onChangeDateTime: (DateTime dateTime) {},
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(80, 8, 80, 8),
                            child: Text("Select time"),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.arrow_circle_right_outlined,
                size: 26.0,
              ),
            ),
            PopupMenuButton<String>(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    title: Text("Settings   "),
                    trailing: Icon(Icons.settings),
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    onTap: ()=> Get.off(LogIn(), transition: Transition.downToUp),
                    child: ListTile(
                      title: Text("Log Out"),
                      trailing: Icon(Icons.logout_outlined),
                    ),
                  ),
                ),
              ];
            }),
          ],
          iconTheme: IconThemeData(color: Colors.white),
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
          toolbarHeight: 90,
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
                      color: isIndex0 ? Color(0xffcfd8dc) : Colors.transparent,
                      offset: Offset(0.0, 130),
                      blurRadius: 7,
                      spreadRadius: 43,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Tab(
                    icon: Bouncy(
                      duration: Duration(milliseconds: 2000),
                      lift: isIndex0 ? 10 : 0,
                      ratio: 0.5,
                      pause: 0.5,
                      child: SimpleAnimatedIcon(
                        startIcon: Icons.cloud_download_sharp,
                        endIcon: Icons.refresh,
                        progress: _progress,
                        transitions: const [
                          Transitions.rotate_ccw,
                          Transitions.zoom_in,
                        ],
                      ),
                    ),
                    text: "Fetch",
                  ),
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
                      color: isIndex0 ? Colors.transparent : Color(0xffcfd8dc),
                      offset: Offset(0.0, 130),
                      blurRadius: 7,
                      spreadRadius: 43,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Tab(
                    icon: Bouncy(
                      duration: Duration(milliseconds: 2000),
                      lift: isIndex0 ? 0 : 10,
                      ratio: 0.5,
                      pause: 0.5,
                      child: SimpleAnimatedIcon(
                        startIcon: Icons.hourglass_empty,
                        endIcon: Icons.check_circle_outline,
                        progress: _progress,
                        transitions: [
                          Transitions.zoom_in,
                          Transitions.rotate_ccw
                        ],
                      ),
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
            AccordionPage(),
            AccordionPage1(),
          ],
        ),
      ),
    );
  }
}
