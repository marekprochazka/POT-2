

import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/providers/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String? username;
  String? email;
  String? _profilePicture;
  String? token;

  User(this.username, this.email, this._profilePicture, this.token);

  String get profilePicture => '${POTEnvironment.apiUrl}$_profilePicture';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] as String,
      json['email'] as String,
      json['profile_picture'] as String,
      json['token'] as String,
    );
  }

  factory User.empty() {
    return User(null, null, null, null);
  }

  void refactor(User user) {
    username = user.username;
    email = user.email;
    _profilePicture = user._profilePicture;
    token = user.token;
  }

  static Future<User> login(BuildContext context ,String username, String password) async {
    final user = await Provider.of<POTApiProvider>(context, listen:false).login(username, password);  
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefsNames.loggedInKey, true);
    prefs.setString(PrefsNames.userDatakey, jsonEncode({
      'username': user.username,
      'email': user.email,
      'profile_picture': user._profilePicture,
      'token': user.token,
    }));
    Provider.of<LoginState>(context, listen: false).loggedIn = true;
    Provider.of<User>(context, listen: false).refactor(user);
    return user;
  }

  Future<void>  logout(BuildContext context, {bool force=false}) async {
    if (!force) {
      await Provider.of<POTApiProvider>(context, listen:false).logout();
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefsNames.loggedInKey, false);
    prefs.remove(PrefsNames.userDatakey);
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
    Provider.of<User>(context, listen: false).token = null;

  }
}