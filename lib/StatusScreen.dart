// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/StatusModel.dart';

class StatusScreen extends StatelessWidget {

  /// We would be creating our data source, ie; where we would be retrieving our data to display on the UI
  /// Our data source would be a list of Status Model named allStatus

  /// We would call the constructor we made initially in our StatusModel
  /// Important!! Make sure you import Our Status model class;
  /// Ie; look at the second import statement above.
  List<StatusModel> allStatus =[
    StatusModel(sender: "Jane", time: "Just Now", imageUrl: "images/onyii.jpeg"),
    StatusModel(sender: "Amaka That Disapoints", time: "10 mins ago", imageUrl: "images/pclient.jpeg"),
    StatusModel(sender: "Julian", time: "30 mins ago", imageUrl: "images/perculiar.jpeg"),
    StatusModel(sender: "Vicky", time: "Today, 2:22 pm", imageUrl: "images/ibi.jpeg"),
    StatusModel(sender: "Jude bro", time: "Today, 3:15 pm", imageUrl: "images/Kuro.jpeg"),
    StatusModel(sender: "Emeka Play boy", time: "Today, 8:07 pm", imageUrl: "images/jammie.jpeg"),
    StatusModel(sender: "Chiamaka That does not disapoint", time: "Yesterday, 8:17 pm", imageUrl: "images/fpromf.jpeg"),
      ];

  /// As you can see how easy it is to create a new StatusModel object and add to our list,
  /// just pass in the parameters with random strings as you prefer.
  ///
  /// Make Sure to pass a valid image url. Now about images.
  /// In other for you to use images to your project you need to (depend on it)
  /// add it to the dependencies on pubspec.yaml at your project root.
  /// You can check to see how the images folder for this was added

  ///  This below is the build method of our StatusScreen class
  ///  It is responsible for building the UI for our StatusScreen

  @override
  Widget build(BuildContext context) {

    /// Create a variable to hold our Ui
    /// In the case, our data source is empty, maybe for instance loading data
    /// from the network and the network request is not done fetching
    /// While the its still fetching, this means our data source will be empty
    /// by creating a variable of type Widget called content we can control
    /// what displays to the user when there is an empty list thus avoiding errors
    /// This is not necessary in this app since our data source is prepopulated but its a "good to know".

    Widget content;
    // Create the control we talked about
    if (allStatus.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content =

      /// Our Content is going to be made up of a Column of
      /// Users Personal Status Tile
      /// and a List that returns our friends Status tile
      new Column(
        children: <Widget>[
          _buildMyPersonalStatusTile(),

          Expanded(child: ListView.builder(
          itemCount: allStatus.length,
          itemBuilder: _buildChatTile,
          )),
  ]);
    }
    //returns a scaffold for the build method which embodies every element
    // that is going to be displayed on the screen
    return new Scaffold(
      body: content,
      // A floating action button
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        elevation: 20.0,
        child: new Icon(Icons.camera_enhance, color: Colors.white,),
      ),
    );
  }

  /// This widget builds our tile for friends statuses that contains
  /// our user avatar(image Url), User name, time.
  Widget _buildChatTile(BuildContext context, int index){
    StatusModel status = allStatus[index];

    return new Column(
        children: <Widget>[

        ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage(status.imageUrl), radius: 30.0,
          ),
          title: new Text(status.sender),
          subtitle: new Text(status.time),
        ),

        new Container(height: 0.15, width: double.infinity, color: Colors.black26, margin: EdgeInsets.only(left: 60.0),)
        ]);
  }
}

Widget _buildMyPersonalStatusTile (){

  // Returns a column that contains  A listTile that displays our personal details
  //Ideally should be retrieved from a persistent data source
    return new
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
      ListTile(
      leading: new CircleAvatar(
          backgroundImage: new AssetImage("images/ray.jpg"), radius: 30.0,
      ),
    title: new Text("My status"),
    subtitle: new Text("Tap to add status update"),
    ),
    // A horizontal container to display the title "Recent Updates"
    new Container(
    height: 20.0, width: double.infinity,
    child: new Container(
  child: new Text("Recent updates", style:
    new TextStyle(color: Colors.green[500]),)
      ,margin: EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),),
      color: Colors.grey[200],
    ),

          ],
      );

}