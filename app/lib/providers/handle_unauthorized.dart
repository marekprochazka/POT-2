

import 'package:app/models/data/user.dart';
import 'package:app/utils/show_error.dart';
import 'package:provider/provider.dart';

Future<void> handleUnauthorized(context, String? message) async {
  if (message != null) {
    showError(context, message);
  }
  Provider.of<User>(context, listen: false).logout(context, force: true);
}