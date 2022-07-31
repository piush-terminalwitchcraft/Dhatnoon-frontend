import 'dart:io' as iofile;
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:components/agora_services/audio_streaming.dart';
import 'package:components/agora_services/front_camera_streaming.dart';
import 'package:components/agora_services/rear_camera_streaming.dart';
import 'package:components/services/audio_player.dart';
import 'package:components/services/audio_recording.dart';
import 'package:components/services/front_camera_pic.dart';
import 'package:components/services/front_camera_recording.dart';
import 'package:components/services/photo_page.dart';
import 'package:components/services/rear_camera_pic.dart';
import 'package:components/services/rear_camera_recording.dart';
import 'package:components/services/video_page.dart';
import 'package:components/state_management/iconChange.dart';
import 'package:components/state_management/state_of_back_cam_pic.dart';
import 'package:components/state_management/state_of_back_cam_rec.dart';
import 'package:components/state_management/state_of_front_cam_pic.dart';
import 'package:components/state_management/state_of_front_cam_rec.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'dart:async';
import 'package:components/services/audio_recording.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AccordionPage extends StatefulWidget //__
{
  const AccordionPage({Key? key}) : super(key: key);

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  IconChange _iconChange = IconChange();
  final _user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontWeight: FontWeight.bold);

  final _contentStyleHeader = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontWeight: FontWeight.w700);

  final _contentStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontWeight: FontWeight.normal);

  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Accordion(
            maxOpenSections: 1,
            // headerBackgroundColorOpened: Colors.black54,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                paddingBetweenOpenSections: 20,
                paddingBetweenClosedSections: 20,
                headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                rightIcon: Icon(
                  Icons.remove_circle,
                  color: Color(0xff250543),
                ),
                headerBorderRadius: 25,
                isOpen: true,
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('Approved requests', style: _headerStyle),
                content: FetchedAcceptedRequest(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                contentBorderRadius: 25,
              ),
              AccordionSection(
                paddingBetweenOpenSections: 20,
                paddingBetweenClosedSections: 20,
                headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                rightIcon: Obx(() => _iconChange.isAccordionOpen.value
                    ? Icon(
                        Icons.remove_circle,
                        color: Color(0xff250543),
                      )
                    : Icon(Icons.add_circle, color: Color(0xff250543))),
                headerBorderRadius: 25,
                isOpen: false,
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('List of pending or rejected requests',
                    style: _headerStyle),
                content: FetchPendingOrRejectedRequest(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                contentBorderRadius: 25,
                onCloseSection: () {
                  _iconChange.accordionClosed();
                },
                onOpenSection: () {
                  _iconChange.accordionOpened();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  FetchPendingOrRejectedRequest() {
    final RequestData = FirebaseFirestore.instance
        .collection('Sessions')
        .where("senderEmail", isEqualTo: _user.email)
        .where("status", isNotEqualTo: "Approved")
        .snapshots();
    return SizedBox(
      height: 128,
      child: StreamBuilder(
        stream: RequestData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 12)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black, width: 0.2),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Sender - ${document['senderEmail']} ${document.id}"),
                    ),
                    Container(
                      child: Text(
                          "Start time - ${document['startTime_Hours'].toString()}:${document['startTime_Minutes'].toString()}"),
                    ),
                    Container(
                      child: Text(
                          "End time - ${document['endTime_Hours'].toString()}:${document['endTime_minutes'].toString()}"),
                    ),
                    Container(
                      child: Text("Phone No - ${document['ReceiverPhoneNo']}"),
                    ),
                    Container(
                      child: Text("Status - ${document['status']}"),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  FetchedAcceptedRequest() {
    final RequestData = FirebaseFirestore.instance
        .collection('Sessions')
        .where("senderEmail", isEqualTo: _user.email)
        .where("status", isEqualTo: "Approved")
        .snapshots();
        
    return SizedBox(
      height: 160,
      child: StreamBuilder(
        stream: RequestData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 12)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black, width: 0.2),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Sender - ${document['senderEmail']} ${document.id}"),
                    ),
                    Container(
                      child: Text("Mode - ${document['mode']}"),
                    ),
                    Container(
                      child: Text(
                          "Start time - ${document['startTime_Hours']}:${document['startTime_Minutes']}"),
                    ),
                    Container(
                      child: Text(
                          "End time - ${document['endTime_Hours']}:${document['endTime_minutes']}"),
                    ),
                    Container(
                      child: Text("Phone No - ${document['ReceiverPhoneNo']}"),
                    ),
                    Container(
                      child: InkWell(
                        child: Text("View"),
                        onTap: () async {
                          print("tap working");
                          if (document['mode'] == 'Live Geo Location') {
                            Get.to(MapWala(
                              latitude: double.parse(document['latitude']),
                              longitude: double.parse(document['longitude']),
                            ));
                          }
                          if (document['mode'] == 'Front Camera Pic') {
                            Get.to(DisplayPictureScreen(
                                imagePath: document['frontImgURL'],
                                cameraMode: 'Front'));
                          }
                          if (document['mode'] == 'Back Camera Pic') {
                            Get.to(DisplayPictureScreen(
                                imagePath: document['backImgURL'],
                                cameraMode: 'Back'));
                          }
                          if (document['mode'] == 'Front Camera 10 Second Video') {
                              Get.to(VideoPage(videoLink: document['frontVideoURL']));
                               // idar click karne ke baad video play hoga
                          }
                          if (document['mode'] == 'Back Camera 10 Second Video') {
                              Get.to(VideoPage(videoLink: document['backVideoURL']));
                               // idar click karne ke baad video play hoga
                          }

                          if (document['mode'] == 'Front Camera Streaming') {
                            Get.to(FrontReciverStream());
                          }
                          if (document['mode'] == 'Back Camera Streaming') {
                            Get.to(BackRecieveStream());
                          }
                          if (document['mode'] == 'Audio Live Streaming') {
                            Get.to(AudioStreaming(documentID: document.id));
                          }
                          if (document['mode'] == 'Audio Recording') {
                                              print("Here");
                                          // Get.to(AudioRecording(documentID: document.id))?.then((path) {
                            
                                          //    print(path);
                                          //    iofile.File audiofile = iofile.File(path);
                                             
                                          //    storage.ref(document.id+".m4a").putFile(audiofile,SettableMetadata(contentType: 'audio/x-m4a', customMetadata: <String, String>{'file': 'audio'},)).then((TaskSnapshot taskSnapshot){
                                          //       if(taskSnapshot.state == TaskState.success) {
                                          //         print("Uploaded to firebase successfully");
                                          //       }
                                          //       else {
                                          //         taskSnapshot.printError();
                                          //       }
                                          //    });
                                             
                                          // });
                                          Get.to(AudioPlayer(documentID: document.id));
                                        }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class AccordionPage1 extends StatefulWidget //__
{
  const AccordionPage1({Key? key}) : super(key: key);

  @override
  State<AccordionPage1> createState() => _AccordionPage1State();
}

class _AccordionPage1State extends State<AccordionPage1> {
  final _user = FirebaseAuth.instance.currentUser!;
  String _phoneNo = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  StateOfFrontCamPic stateOfFrontCamPic = Get.find();
  StateOfBackCamPic stateOfBackCamPic = Get.find();

  StateOfFrontCamRec stateOfFrontCamRec = Get.find();
  StateOfBackCamRec stateOfBackCamRec = Get.find();

  // geo-location
  String _latitude = "0.0";
  String _longitude = "0.0";

  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontWeight: FontWeight.bold);

  @override
  build(context) {
    firestore
        .collection('userInfo')
        .where("useremail", isEqualTo: _user.email.toString())
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _phoneNo = doc['phone'];
      });
    });
    ;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black54,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                paddingBetweenOpenSections: 20,
                paddingBetweenClosedSections: 20,
                headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                rightIcon: Icon(
                  Icons.add_circle,
                  color: Color.fromARGB(255, 11, 61, 102),
                ),
                headerBorderRadius: 25,
                isOpen: true,
                // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('Requests sent to you', style: _headerStyle),
                content: FetchAllRequest(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                contentBorderRadius: 25,
                onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                paddingBetweenOpenSections: 20,
                paddingBetweenClosedSections: 20,
                headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                rightIcon: Icon(
                  Icons.add_circle,
                  color: Color.fromARGB(255, 11, 61, 102),
                ),
                headerBorderRadius: 25,
                isOpen: false,
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('List of pending or rejected requests',
                    style: _headerStyle),
                content: FetchUnansweredRequest(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                contentBorderRadius: 25,
                onCloseSection: () => print('onCloseSection ...'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FetchAllRequest() {
    final RequestData = FirebaseFirestore.instance
        .collection('Sessions')
        .where("ReceiverPhoneNo", isEqualTo: _phoneNo)
        .snapshots();
    print(_phoneNo);
    return SizedBox(
      height: 150,
      child: StreamBuilder(
        stream: RequestData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 12)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black, width: 0.2),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Sender - ${document['senderEmail']} ${document.id}"),
                    ),
                    Container(
                      child: Text("Mode - ${document['mode']}"),
                    ),
                    Container(
                      child: Text(
                          "Start time - ${document['startTime_Hours']}:${document['startTime_Minutes']}"),
                    ),
                    Container(
                      child: Text(
                          "End time - ${document['endTime_Hours']}:${document['endTime_minutes']}"),
                    ),
                    (document['status'] == 'Approved')
                        ? Container(child: Text("Accepted"))
                        : (document['status'] == 'rejected')
                            ? Container(child: Text("Rejected"))
                            : Container(
                                width: 110,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        firestore
                                            .collection("Sessions")
                                            .doc(document.id)
                                            .update({'status': 'Approved'});
                                        if (document['mode'] ==
                                            'Live Geo Location') {
                                          _determinePosition().then((value) {
                                            firestore
                                                .collection("Sessions")
                                                .doc(document.id)
                                                .update({
                                              'latitude':
                                                  value.latitude.toString(),
                                              'longitude':
                                                  value.longitude.toString(),
                                            });
                                          });
                                        }
                                        if (document['mode'] ==
                                            'Front Camera Pic') {
                                          Get.to(FrontCameraPic());

                                          Future.delayed(Duration(seconds: 4),
                                              () {
                                            XFile img = stateOfFrontCamPic
                                                .frontCameraPic.value;

                                            final filename =
                                                document.id;
                                            iofile.File imageFile =
                                                iofile.File(img.path);
                                            try {
                                              storage
                                                  .ref(filename)
                                                  .putFile(imageFile)
                                                  .then((taskSnapshot) {
                                                storage
                                                    .ref(filename)
                                                    .getDownloadURL()
                                                    .then((url) {
                                                  firestore
                                                      .collection("Sessions")
                                                      .doc(document.id)
                                                      .update(
                                                          {'frontImgURL': url});
                                                });
                                              });
                                            } on FirebaseException catch (error) {
                                              if (kDebugMode) {
                                                print(error);
                                              }
                                            }
                                            ;
                                          });
                                        }

                                        if (document['mode'] ==
                                            'Back Camera Pic') {
                                          Get.to(RearCameraPic());

                                          Future.delayed(Duration(seconds: 4),
                                              () {
                                            XFile img = stateOfBackCamPic
                                                .backCameraPic.value;

                                            final filename =
                                                document.id;
                                            iofile.File imageFile =
                                                iofile.File(img.path);
                                            try {
                                              storage
                                                  .ref(filename)
                                                  .putFile(imageFile)
                                                  .then((taskSnapshot) {
                                                storage
                                                    .ref(filename)
                                                    .getDownloadURL()
                                                    .then((url) {
                                                  firestore
                                                      .collection("Sessions")
                                                      .doc(document.id)
                                                      .update(
                                                          {'backImgURL': url});
                                                });
                                              });
                                            } on FirebaseException catch (error) {
                                              if (kDebugMode) {
                                                print(error);
                                              }
                                            }
                                            ;
                                          });
                                        }

                                        if (document['mode'] ==
                                            'Front Camera 10 Second Video') {
                                            Get.to(FrontCameraRecording());

                                          Future.delayed(Duration(seconds: 14),
                                              () {

                                            XFile img = stateOfFrontCamRec
                                                .frontCameraRec.value;

                                            final filename =
                                                path.basename(img.path);
                                            iofile.File imageFile =
                                                iofile.File(img.path);
                                            try {
                                              storage
                                                  .ref(filename)
                                                  .putFile(imageFile, SettableMetadata(contentType: 'video/mp4'))
                                                  .then((taskSnapshot) {
                                                storage
                                                    .ref(filename)
                                                    .getDownloadURL()
                                                    .then((url) {
                                                  firestore
                                                      .collection("Sessions")
                                                      .doc(document.id)
                                                      .update(
                                                          {'frontVideoURL': url});
                                                });
                                              });
                                            } on FirebaseException catch (error) {
                                              if (kDebugMode) {
                                                print(error);
                                              }
                                            }
                                            ;
                                          });
                                        }

                                        if (document['mode'] ==
                                            'Back Camera 10 Second Video') {
                                            Get.to(RearCameraRecording());

                                          Future.delayed(Duration(seconds: 14),
                                              () {
                                            XFile img = stateOfBackCamRec.backCameraRec.value;

                                            final filename =
                                                path.basename(img.path);
                                            iofile.File imageFile =
                                                iofile.File(img.path);
                                            try {
                                              storage
                                                  .ref(filename)
                                                  .putFile(imageFile, SettableMetadata(contentType: 'video/mp4'))
                                                  .then((taskSnapshot) {
                                                storage
                                                    .ref(filename)
                                                    .getDownloadURL()
                                                    .then((url) {
                                                  firestore
                                                      .collection("Sessions")
                                                      .doc(document.id)
                                                      .update(
                                                          {'backVideoURL': url});
                                                });
                                              });
                                            } on FirebaseException catch (error) {
                                              if (kDebugMode) {
                                                print(error);
                                              }
                                            }
                                            ;
                                          });
                                        }

                                        if (document['mode'] ==
                                            'Front Camera Streaming') {
                                          Get.to(FrontSendStream());
                                        }
                                        if (document['mode'] ==
                                            'Back Camera Streaming') {
                                          Get.to(BackSendStream());
                                        }
                                        if (document['mode'] ==
                                            'Audio Recording') {
                                          Get.to(AudioPlayer(documentID: document.id));
                                        }
                                      },
                                      child: Text("Accept ?"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        firestore
                                            .collection("Sessions")
                                            .doc(document.id)
                                            .update({'status': 'rejected'});
                                      },
                                      child: Text("Reject ?"),
                                    ),
                                  ],
                                ),
                              )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  FetchUnansweredRequest() {
    final RequestData = FirebaseFirestore.instance
        .collection('Sessions')
        .where("ReceiverPhoneNo", isEqualTo: _phoneNo)
        .where("status", isNotEqualTo: "Approved")
        .snapshots();
    print(_phoneNo);
    return SizedBox(
      height: 128,
      child: StreamBuilder(
        stream: RequestData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 12)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black, width: 0.2),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Sender - ${document['senderEmail']} ${document.id}"),
                    ),
                    Container(
                      child: Text(
                          "Start time - ${document['startTime_Hours']}:${document['startTime_Minutes']}"),
                    ),
                    Container(
                      child: Text(
                          "End time - ${document['endTime_Hours']}:${document['endTime_minutes']}"),
                    ),
                    Container(
                      child: Text("status - ${document['status']}"),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class MapWala extends StatelessWidget {
  const MapWala({Key? key, this.latitude, this.longitude}) : super(key: key);

  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(latitude!, longitude!), zoom: 14.5),
        markers: {
          Marker(
              markerId: MarkerId("source"),
              position: LatLng(latitude!, longitude!)),
        },
      ),
    );
  }
}
