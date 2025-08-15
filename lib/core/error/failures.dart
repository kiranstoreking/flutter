abstract class Failure {
  final String message;
  final String? code;
  final dynamic details;

  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() => 'Failure: $message';
}

class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class CacheFailure extends Failure {
  const CacheFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class PermissionFailure extends Failure {
  const PermissionFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required String message,
    String? code,
    dynamic details,
  }) : super(message: message, code: code, details: details);
}
