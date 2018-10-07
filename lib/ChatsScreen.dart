// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/ChatModel.dart';

/// This Widget is a stateless Widget,
/// since for the scope of this we wouldn't be making any dynamic changes to the UI after build.

class ChatsScreen extends StatelessWidget {

  /// We would be creating our data source, ie; where we would be retrieving our data to display on the UI
  /// Our data source would be a list of ChatModel named allChats

  /// We would call the constructor we made initially in our ChatModel
  /// Important!! Make sure you import Our chat model class;
  /// Ie; look at the second import statement above.

  List<ChatModel> allChats =[
    ChatModel(sender: "Jane", messageShort: "Hello the love of my life", imageUrl: "images/onyii.jpeg", unreads: "3", time: "9:30"),
    ChatModel(sender: "Amaka That Dissapoints", messageShort: "Chai ", imageUrl: "images/pclient.jpeg", time: "23:17"),
    ChatModel(sender: "Julian", messageShort: "It was awesome dear", imageUrl: "images/ibi.jpeg", unreads: "11", time: "Yesterday"),
    ChatModel(sender: "Vicky", messageShort: "Hehe Ray I get plenty gist ooo", imageUrl: "images/fpromf.jpeg", unreads: "2", time: "Yesterday"),
    ChatModel(sender: "Jude bro", messageShort: "Quick Gig bro, hope you're ava... ", imageUrl: "images/Kuro.jpeg", time: "01/10/2018"),
    ChatModel(sender: "Amaka bae", messageShort: "LMAO say that again ", imageUrl: "images/perculiar.jpeg", time: "01/10/2018"),
    ChatModel(sender: "Emeka Play boy", messageShort: "Lol my guy something...", imageUrl: "images/jammie.jpeg", time: "02/10/2018"),
  ];

  /// As you can see how easy it is to create a new ChatModel object,
  /// just pass in the parameters with random strings as you prefer.
  ///
  /// Make Sure to pass a valid image url. Now about images.
  /// In other for you to use images to your project you need to (depend on it)
  /// add it to the dependencies on pubspec.yaml at your project root.
  /// You can check to see how the images folder for this was added

  ///  This below is the build method of our ChatsScreen class
  ///  It is responsible for building the UI for our ChatsScreen

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
    if (allChats.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: allChats.length,
        itemBuilder: _buildChatTile,
      );
    }

    //returns a scaffold for the build method which embodies every element
    // that is going to be displayed on the screen
    return new Scaffold(
      body: content,
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        elevation: 20.0,
        child: new Icon(Icons.message, color: Colors.white,),
      ),
    );
  }

  /// This widget builds our tile that contains
  /// our user avatar, sender, chat message etc

  Widget _buildChatTile(BuildContext context, int index){

    // Here we are going to retrieve an object of our ChatModel from our list source, allChats.
    /// Index represents the position on the list of the Chat Model being retrieved
    /// We are going to display this in a ListTile
    ChatModel chat = allChats[index];


    /// We are returning a listTile, passing our retrieved ChatModel object as the parameter(s)
    return new Column(
        children: <Widget>[
          ListTile(
            leading: new CircleAvatar(
              backgroundImage: new AssetImage(chat.imageUrl),
              radius: 25.0,
            ),
            title: new Text(chat.sender),
            subtitle: new  Text(chat.messageShort, maxLines: 1, ),
            trailing: _buildTrailing(context, chat),
            isThreeLine: false,
          ),
          // Creating a line divider for our listView. There is another way to do it, but this is my most preferred.
          new Container(height: 0.15, width: double.infinity, color: Colors.black26, margin: EdgeInsets.only(left: 60.0),)
        ]);
  }

  Widget _buildTrailing(BuildContext context, ChatModel chat){
    Widget unread;
    if (chat.unreads == ""){
      unread = new Text(""); /// If the unread parameter is the default "" we set our unread widget to null
      /// thereby nothing will be displayed for unread on the screen.
    }else{
      unread = new CircleAvatar(
        child: new FittedBox(
          child: new Text(chat.unreads, style: new TextStyle(fontSize: 10.0),),
          fit: BoxFit.fill,), backgroundColor: Colors.green, maxRadius: 8.0,);
    }
    return new Column(
      children: <Widget>[
        new Padding(child: Text(chat.time, style: new TextStyle(fontSize: 10.0),),
          padding: EdgeInsets.only( bottom: 10.0),),
        unread
      ],
    );
  }

}
