import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RouteNames {
  static const homePage = 'HOMEPAGE';
  static const errorPage = 'ERRORPAGE';
  static const loginPage = 'LOGINPAGE';
  static const signInPage = 'SIGNINPAGE';
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

class POTAssets {
}

class POTTextStyles {
  static const TextStyle largeTitle = TextStyle(fontWeight: FontWeight.bold, fontSize: 32, fontFamily: 'Roboto', color: POTColors.white);
}

class POTEnvironment {
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}