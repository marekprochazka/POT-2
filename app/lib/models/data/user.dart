

import 'package:app/constants.dart';

class User {
  final String username;
  final String email;
  final String _profilePicture;
  final String token;

  User(this.username, this.email, this._profilePicture, this.token);

  String get profilePicture => '${POTEnvironment.apiUrl}$_profilePicture';
}