// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com

/// This is the model class to handle everything as relate
/// with our call screen.
///
/// Our data source for this model like with other models shall be a list.
/// It shall accept 3 strings and 2 boolean values
/// All our parameters are passed a default value, namely;
/// true, true, Unknown Caller, etc.
/// The variables are named after what they represent.


class CallModel{

  String time, caller, imageUrl;
  bool isCall, callMade;


  CallModel({
    this.isCall = true,
    this.callMade = true,
    this.caller = "Unknown Caller",
    this.time = "Unknown Time",
    this.imageUrl = "images/portrait_placeholder.png"
});

}
