

import 'package:app/constants.dart';
import 'package:app/models/environment.dart';

class User {
  final String username;
  final String email;
  final String _profilePicture;

  User(this.username, this.email, this._profilePicture);

  String get profilePicture => '${POTEnvironment.apiUrl}$_profilePicture';
}