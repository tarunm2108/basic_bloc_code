import 'package:flutter/material.dart';

class Navigation {
  static final Navigation instance = Navigation._internal();

  factory Navigation() => instance;

  Navigation._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arg}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  void pop({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }

  Future<dynamic> popAllAndPushName(String routeName, {dynamic arg}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arg);
  }
}
