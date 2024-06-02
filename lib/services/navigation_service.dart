import 'package:fb_chat_app/pages/home_page.dart';
import 'package:fb_chat_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> _navigatorKey;

  final Map<String, Widget Function(BuildContext)> _routes = {
    "/login": (context) => LoginPage(),
    "/home": (context) => HomePage(),
  };
  GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)> get routes {
    return _routes;
  }

  NavigationService() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  void pushName(String routeName) {
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void pushReplacementName(String routeName) {
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBack(String routeName) {
    _navigatorKey.currentState?.pop();
  }
}
