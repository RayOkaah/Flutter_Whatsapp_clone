// With love by ©Ray Okaah - RayOkaah.me| RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com

import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(child:
      new Icon(Icons.tag_faces, color: Colors.green, size: 100.0,), ); //returns an empty container with a smiley face icon
  }
}

/// This is just an empty page for now as implementing a camera,
/// accepting user input such as images is not in the scope and target of this
/// version. Perhaps later I would drop an article on that.