import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';



class Request extends StatefulWidget {
  Request({Key? key, this.title = 'Flutter Demo Home Page'})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Request object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'test',
        child: Material(
          color: Colors.white,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: const Icon(
            Icons.add_rounded,
            size: 56,
          ),
        ),
        popUp: PopUpItem(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 2,
          tag: 'test',
          child: PopUpItemBody(),
        ),
      ),
    );
  }
}

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'New todo',
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Write a note',
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
            maxLines: 6,
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}