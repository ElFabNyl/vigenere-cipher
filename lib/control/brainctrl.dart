import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Brainctrl extends GetxController {
  ///auth variables
  var userEmail = ''.obs;
  var isInvisible = true.obs;
  var userName = ''.obs;


  ///animation
   List<MaterialColor> colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

 TextStyle colorizeTextStyle = const TextStyle(
  fontSize: 25.0,  
);
}