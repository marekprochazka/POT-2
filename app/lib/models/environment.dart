import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environ {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.dev';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'Not found';
  }
}
