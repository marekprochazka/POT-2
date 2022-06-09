import 'package:app/constants.dart';

String getUrlString(String path) {
  return '${POTEnvironment.apiUrl}$path';
}