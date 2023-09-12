import 'package:flutter/cupertino.dart';

class WidthHeight {
  
// Function to get the screen width
double screenWidth(BuildContext context, double widthValue) {
  return MediaQuery.of(context).size.width * widthValue;
}

// Function to get the screen height
double screenHeight(BuildContext context, double heightValue) {
  return MediaQuery.of(context).size.height * heightValue;
}
}