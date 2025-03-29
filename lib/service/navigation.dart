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

  Future<dynamic>? replaceView(Widget route) {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute<void>(
              builder: (BuildContext context) =>  route,
            ),);
  }

  Future<dynamic>? replace(String route, {dynamic arg}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arg);
  }

  Future<dynamic>? popAllAndPushView(Widget route, {dynamic arg}) {
    return navigatorKey.currentState!
        .pushAndRemoveUntil(MaterialPageRoute<void>(
      builder: (BuildContext context) =>  route,
    ), (route) => false,);
  }

}
