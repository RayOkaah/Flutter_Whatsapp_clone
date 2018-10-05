// With love by ©Ray Okaah - RayOkaah.me | flutterengineer.com

/// This is the model class to handle everything as relate
/// with our Status screen.
///
/// Our data source for this model like with other models shall be a list.
/// It shall accept 3 strings.
/// All our parameters are passed a default value, namely;
/// Unknown sender, Unknown Time, images/portrait_placeholder, etc.
///
/// Ideally the Constructor should always run wih all
/// the necessary parameters so the defaults are never called.
/// The variables are named after what they represent.

class StatusModel{

  //Declaring class variables
  String time, sender,imageUrl;

  //Our Constructor for the class ChatModel

  StatusModel({
    this.sender = "Unknown sender",
    this.time = "Unknown Time",
    this.imageUrl = "images/portrait_placeholder.png"
  });

}
