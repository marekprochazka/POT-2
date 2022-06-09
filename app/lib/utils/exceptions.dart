class UnauthorizedException implements Exception {
  UnauthorizedException(this.message);

  final String message;
}

class BadRequestException implements Exception {
  BadRequestException(this.message);

  final Map message;
}