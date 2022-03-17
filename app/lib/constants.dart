import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Route {
  final String name;
  final String path;
  Route({required this.name, required this.path});
}

class RouteNames {
  static final homePage = Route(name: 'HOMEPAGE', path: '/');
  static final errorPage = Route(name: 'ERRORPAGE', path: '/error');
  static final loginPage = Route(name: 'LOGINPAGE', path: '/login');
  static final signInPage = Route(name: 'SIGNINPAGE', path: '/sign/in');
  static final messagesPage = Route(name: 'MESSAGESPAGE', path: '/messages');
  static final settingsPage = Route(name: 'SETTINGSPAGE', path: '/settings');
  static final userInfoPage = Route(name: 'USERINFOPAGE', path: '/userInfo');

  static String getNameFromPath(String path) {
    List routes = <Route>[
      homePage,
      errorPage,
      loginPage,
      signInPage,
      messagesPage,
      settingsPage,
      userInfoPage
    ];
    for (Route param in routes) {
      if (param.path == path) {
        return param.name;
      }
    }
    return '';
  }
}

class PrefsNames {
  static const loggedInKey = 'loggedIn';
}

class POTColors {
  static const Color primary = Color(0xFF242582);
  static const Color secondary = Color(0xFF553D67);
  static const Color tertiary = Color(0xFFF64C72);

  static const Color white = Color(0xFFF9FAFE);

  static const Color primary50 = Color.fromARGB(120, 36, 38, 130);
}

class POTAssets {}

class POTTextStyles {
  static const TextStyle largeTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      fontFamily: 'Roboto',
      color: POTColors.white);
  static const TextStyle navbarText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: 'Roboto',
      color: POTColors.white);
  static const TextStyle navbarText__active = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: 'Roboto',
      color: POTColors.tertiary);
}

class POTEnvironment {
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}
