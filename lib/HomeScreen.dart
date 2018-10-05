// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CallsScreen.dart';
import 'package:whatsapp_clone/CameraScreen.dart';
import 'package:whatsapp_clone/ChatsScreen.dart';
import 'package:whatsapp_clone/StatusScreen.dart';

/// This is the page responsible for creating, handling and controlling our
/// Tab Bar

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomeScreenState createState() => new _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        body: new DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                elevation: 7.0,
                title: new Text("WhatsApp"),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(icon: new Icon(Icons.photo_camera)),
                    Tab(text: "CHATS"),
                    Tab(text: "STATUS"),
                    Tab(text: "CALLS"),

                  ],
                ),
              ),
              body: TabBarView(
                  children: [
                    new CameraScreen(),
                    new ChatsScreen(),
                    new StatusScreen(),
                    new CallsScreen(),

                  ]
              ),
            )),
    );
  }
}