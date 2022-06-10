
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Route {
  final String name;
  final String path;
  Route({required this.name, required this.path});
}

class RouteNames {
  static final homePage = Route(name: 'HOMEPAGE', path: '/');
  static final errorPage = Route(name: 'ERRORPAGE', path: 'error');
  static final loginPage = Route(name: 'LOGINPAGE', path: '/login');
  static final signInPage = Route(name: 'SIGNINPAGE', path: 'signin');
  static final messagesPage = Route(name: 'MESSAGESPAGE', path: 'messages');
  static final settingsPage = Route(name: 'SETTINGSPAGE', path: 'settings');
  static final userInfoPage = Route(name: 'USERINFOPAGE', path: 'userInfo');
  static final trainingPlanPage = Route(name: 'TRAININGPLANPAGE', path: 'trainingPlan/:id');


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
  static const userDatakey = 'userData';
}

class POTColors {
  static const Color primary = Color(0xFF242582);
  static const Color secondary = Color(0xFF553D67);
  static const Color tertiary = Color(0xFFF64C72);

  static const Color white = Color(0xFFF9FAFE);

  static const Color primary50 = Color.fromARGB(120, 36, 38, 130);
  static const Color error = Color.fromARGB(120, 244, 76, 76);
}

class POTAssets {}

class POTTextStyles {
  static const TextStyle navbarTitle = TextStyle(
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
  static const TextStyle pageTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      fontFamily: 'Roboto',
      color: POTColors.primary);
  static const TextStyle defaultButtonText = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 8,
      fontFamily: 'Roboto',
      color: POTColors.white);
  static const TextStyle excerciseDescription = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      fontFamily: 'Roboto',
      color: POTColors.white,);

  static TextStyle dynamicText(double size, FontWeight weight, Color color) {
    return TextStyle(
        fontWeight: weight, fontSize: size, fontFamily: 'Roboto', color: color);
  }
}

class POTEnvironment {
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}

class POTGradients {
  static const LinearGradient defaultGradient = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[POTColors.primary, POTColors.secondary],
              stops: [0.0, 1.0]);
}

class HTTPStatusOK {
  static const int get = 200;
  static const int post = 201;
  static const int delete = 204;
  static const int patch = 200;
  static const int put = 200;
}