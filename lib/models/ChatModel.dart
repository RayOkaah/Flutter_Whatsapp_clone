// With love by ©Ray Okaah - RayOkaah.me | flutterengineer.com

/// This is the model class to handle everything as relate
/// with our Chat screen.
///
/// Our data source for this model like with other models shall be a list.
/// It shall accept 4 strings.
/// All our parameters are passed a default value, namely;
/// Unknown sender, Unknown Time, images/portrait_placeholder, etc.
///
/// Ideally the Constructor should always run wih all
/// the necessary parameters so the defaults are never called.
/// The variables are named after what they represent.


class ChatModel{


  //Declaring class varibles
  String unreads, messageShort, sender, imageUrl, time;

//Our Constructor for the class ChatModel
  ChatModel({
    this.sender = "Unknown sender",
    this.messageShort = "Unknown Time",
    this.imageUrl = "images/portrait_placeholder.png",
    this.unreads = "",
    this.time
  });






}
