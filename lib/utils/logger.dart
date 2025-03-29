import 'dart:developer';

import 'package:flutter/foundation.dart';


class Logger {
  static final Logger instance = Logger._internal();
  Logger._internal();
  factory Logger() => instance;

  void printLog(dynamic data){
    if(kDebugMode){
      log("===> $data");
    }
  }

  void printError(dynamic data){
    if(kDebugMode){
      log("===>Error ",error: "$data");
    }
  }
}