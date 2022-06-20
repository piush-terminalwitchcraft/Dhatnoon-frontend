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
      body: Accordion(
        maxOpenSections: 1,
        headerBackgroundColorOpened: Colors.black54,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
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
            // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Colors.white,
            headerBackgroundColorOpened: Colors.white,
            header: Text('Approved requests', style: _headerStyle),
            content: Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            contentBorderColor: Colors.white,
            contentBorderRadius: 25,
            onCloseSection: () => print('onCloseSection ...'),
          ),

          AccordionSection(
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
            header: Text('List of pending or rejected requests', style: _headerStyle),
            content: Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            contentBorderColor: Colors.white,
            contentBorderRadius: 25,
            onCloseSection: () => print('onCloseSection ...'),
          ),

          AccordionSection(
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
            header: Text('Make a request', style: _headerStyle),
            content: Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            contentBorderColor: Colors.white,
            contentBorderRadius: 25,
            onCloseSection: () => print('onCloseSection ...'),
          ),
        ],
      ),
    );
  }
}

