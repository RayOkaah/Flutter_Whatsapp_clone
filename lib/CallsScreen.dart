// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/CallModel.dart';

class CallsScreen extends StatelessWidget {

  /// We would be creating our data source, ie; where we would be retrieving our data to display on the UI
  /// Our data source would be a list of CallModel named allCalls

  /// We would call the constructor we made initially in our CallModel
  /// Important!! Make sure you import Our Call model class;
  /// Ie; look at the second import statement above.

  List<CallModel> allCalls =[
    CallModel(caller: "Julian", time: "30 mins ago", imageUrl: "images/perculiar.jpeg", callMade: true),
    CallModel(caller: "Amaka That Disapoints", time: "1:am, Today", imageUrl: "images/pclient.jpeg", callMade: false),
    CallModel(caller: "Vicky", time: "Today, 2:22 pm", imageUrl: "images/fpromf.jpeg", callMade: true),
    CallModel(caller: "Jude bro", time: "Today, 3:15 pm", imageUrl: "images/Kuro.jpeg", callMade: false, isCall: false),
    CallModel(caller: "Emeka Play boy", time: "Today, 8:07 pm", imageUrl: "images/jammie.jpeg", callMade: true),
    CallModel(caller: "Chiamaka That does not disapoint", time: "Yesterday, 8:17 pm", imageUrl: "images/ibi.jpeg", callMade: true ),
    CallModel(caller: "Jane", time: "20th September", callMade: true, imageUrl: "images/onyii.jpeg"),
      ];

  /// As you can see how easy it is to create a new CallModel object,
  /// just pass in the parameters with random strings as you prefer and the booleans as needed.
  ///
  /// Make Sure to pass a valid image url. Now about images.
  /// In other for you to add images to your project you need to (depend on it)
  /// add it to the dependencies on pubspec.yaml at your project root.
  /// You can check to see how the images folder for this was added

  ///  This below is the build method of our ChatsScreen class
  ///  It is responsible for building the UI for our ChatsScreen

  @override
  Widget build(BuildContext context) {

    /// Create a variable to hold our Ui Content
    /// In the situation, that our data source is empty, maybe for instance; the data is loading
    /// from a network and the network request is not done fetching,
    /// this means our data source will be empty
    /// by creating a variable of type Widget called content we can control
    /// what displays to the user when there is an empty list thus avoiding errors
    /// This is not necessary in this app since our data source is pre-populated but its a "good to know".

    Widget content;

    if (allCalls.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: allCalls.length,
        itemBuilder: _buildChatTile,
      );
    }

    //returns a scaffold for the build method which embodies every element
    // that is going to be displayed on the screen
    return new Scaffold(
      body: content,
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.call, color: Colors.white,),
      ),
    );
  }

  /// This widget builds our tile that contains
  /// our call Icon, caller name, caller avatar,
  /// and a call signal that tells whether it was a voice call or video,
  /// and a  _callSignal that determines the right icon to show
  /// determined by whether the call was made or received.

  Widget _buildChatTile(BuildContext context, int index){
    CallModel call = allCalls[index];
    getCallTime(call);
    Widget callIcon;
    if (call.isCall){
      callIcon = new Icon(Icons.call,textDirection: TextDirection.rtl, color: Colors.green,);
    } else {
      callIcon = new Icon(Icons.videocam, color: Colors.green,);
    }

    /// returns a new column that contains our ListTile and our Line divider
    return new Column(
        children: <Widget>[

          ListTile(
            leading: new CircleAvatar(
              backgroundImage: new AssetImage(call.imageUrl),
              //child: new Text("Ray"), radius: 25.0,
            ),
            title: new Text(call.caller),
            subtitle: _callSignal(),
            trailing: callIcon,
          ),

          // Creating a line divider for our listView. There is another way to do it, but this is my most preferred.
          new Container(height: 0.15, width: double.infinity, color: Colors.black27, margin: EdgeInsets.only(left: 59.9),)
        ]);
  }

  // This is a generic form for most languages
  // There is a shorter way to do get methods in flutter remind me on the next
  CallModel myCallModel; // We create a new CallModel Object called myCallModel
  // We will use this method to pass our CallModel object between different methods

  getCallTime(CallModel data) {
    myCallModel = data;
  }

// This widget decides what Icon to show, a green up arrow icon or a red down arrow icon,
// based on the data it receives from the Call Model object.

  Widget _callSignal(){

    Widget callIcon; // Our Widget to hold the right icon to show

        if (myCallModel.callMade){
        callIcon = new Icon(Icons.call_made, color: Colors.greenAccent, size: 20.1,);
        } else {
        callIcon = new Icon(Icons.call_received, color: Colors.red, size: 20.1,);
        }

        // Returns a new Row  that displays the right callIcon and time call was made
    return new Row(
      children: <Widget>[
        callIcon,
        new Text(myCallModel.time),

      ],);
  }
}

