
import 'package:app/providers/handle_unauthorized.dart';
import 'package:app/utils/exceptions.dart';
import 'package:app/utils/show_error.dart';
import 'package:flutter/cupertino.dart';

Future<T?> handleApiCall<T>(BuildContext context, Future<T> Function()  apiCall) async {
  try {
    return await apiCall();
  }
  on UnauthorizedException catch(e) {
    handleUnauthorized(context, e.message);
  }
  catch(e) {
    showError(context, e.toString());
  }
  return null;
}