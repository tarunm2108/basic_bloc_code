import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Utility {
  static List<Color> listColors = [
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.blue
  ];

  static Future<bool> checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
