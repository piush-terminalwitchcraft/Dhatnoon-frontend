import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
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
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('Accordion'),
      ),
      body: Accordion(
        maxOpenSections: 1,
        headerBackgroundColorOpened: Colors.black54,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            onOpenSection: () => Get.to(AlignedPos(), transition: Transition.noTransition, duration: Duration(milliseconds: 1)),
            headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            rightIcon: Icon(
              Icons.add_circle,
              color: Color.fromARGB(255, 11, 61, 102),
            ),
            headerBorderRadius: 25,
            isOpen: false,
            // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Colors.white,
            headerBackgroundColorOpened: Colors.white,
            header: Text('Introduction', style: _headerStyle),
            content: Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            contentBorderColor: Colors.white,
            contentBorderRadius: 25,
            onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.contact_page, color: Colors.white),
            header: Text('Contact', style: _headerStyle),
            content: Wrap(
              children: List.generate(
                  30,
                  (index) => const Icon(Icons.contact_page,
                      size: 30, color: Color(0xff999999))),
            ),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.computer, color: Colors.white),
            header: Text('Jobs', style: _headerStyle),
            content:
                const Icon(Icons.computer, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.movie, color: Colors.white),
            header: Text('Culture', style: _headerStyle),
            content:
                const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.people, color: Colors.white),
            header: Text('Community', style: _headerStyle),
            content:
                const Icon(Icons.people, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.map, color: Colors.white),
            header: Text('Map', style: _headerStyle),
            content: const Icon(Icons.map, size: 200, color: Color(0xff999999)),
          ),
        ],
      ),
    );
  }
}

class AlignedPos extends StatelessWidget {
  const AlignedPos({Key? key}) : super(key: key);

   final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontWeight: FontWeight.normal);

  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Accordion(
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              rightIcon: Icon(
                Icons.add_circle,
                color: Color.fromARGB(255, 11, 61, 102),
              ),
              headerBorderRadius: 25,
              isOpen: true,
              headerBackgroundColor: Colors.white,
              headerBackgroundColorOpened: Colors.white,
              header: Text('Introduction', style: _headerStyle),
              content: Text(_loremIpsum, style: _contentStyle),
              contentHorizontalPadding: 20,
              contentBorderWidth: 1,
              contentBorderColor: Colors.white,
              contentBorderRadius: 25,
              onCloseSection: () =>  Future.delayed(Duration(milliseconds: 200), ()=>Get.off(AccordionPage(), transition: Transition.noTransition, duration: Duration(milliseconds: 1))),
            ),
          ],
        ),
      ),
    );
  }
}
