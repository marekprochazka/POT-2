import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/main.dart';
import 'package:app/models/data/user.dart';
import 'package:app/models/environment.dart';
import 'package:app/providers/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> potInit() async {
  await dotenv.load(fileName: Environ.fileName);
  final prefs = await SharedPreferences.getInstance();
  final loginState = LoginState(prefs);
  User? user = User.empty();
  loginState.checkLoggedIn();
  if (loginState.loggedIn) {
    user.refactor(User.fromJson(
      jsonDecode(prefs.getString(PrefsNames.userDatakey)!),
    ));
  }
  runApp(POTEntry(loginState: loginState, user: user));
}
