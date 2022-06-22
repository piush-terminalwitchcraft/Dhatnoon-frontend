import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:components/state_management/iconChange.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class AccordionPage extends StatefulWidget //__
{
  const AccordionPage({Key? key}) : super(key: key);

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  IconChange _iconChange = IconChange();

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
                // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('Approved requests', style: _headerStyle),
                content: ListOfItems(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                contentBorderRadius: 25,
              ),

              AccordionSection(
                paddingBetweenOpenSections: 20,
                paddingBetweenClosedSections: 20,
                headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                rightIcon: Obx(()=> _iconChange.isAccordionOpen.value? Icon(Icons.remove_circle, color: Color(0xff250543),):Icon(Icons.add_circle, color:Color(0xff250543))),
                headerBorderRadius: 25,
                isOpen: false,
                headerBackgroundColor: Colors.white,
                headerBackgroundColorOpened: Colors.white,
                header: Text('List of pending or rejected requests',
                    style: _headerStyle),
                content: ListOfItems(),
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
}

Widget ListOfItems() {
  return SizedBox(
    height: 300,
    child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
     children: <Widget>[
       Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("List 1"))
        ),
       ),
       SizedBox(width: 20),
       Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("List 2"))
        ),
       ),
       SizedBox(width: 20),Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("List 3"))
        ),
       ),
       SizedBox(width: 20),Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("List 4"))
        ),
       ),
       SizedBox(width: 20),Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("List 5"))
        ),
       ),
       SizedBox(width: 20),
     ]
    )
),
  );
}

class AccordionPage1 extends StatefulWidget //__
{
  const AccordionPage1({Key? key}) : super(key: key);

  @override
  State<AccordionPage1> createState() => _AccordionPage1State();
}

class _AccordionPage1State extends State<AccordionPage1> {
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
                content: ListOfItems(),
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
                content: ListOfItems(),
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
}
