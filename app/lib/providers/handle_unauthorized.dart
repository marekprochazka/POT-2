

import 'package:app/models/data/user.dart';
import 'package:provider/provider.dart';

Future<void> handleUnauthorized(context) async {
  Provider.of<User>(context, listen: false).logout(context, force: true);
}