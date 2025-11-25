import 'package:meta/meta.dart';

/// Base class for all API exceptions
@immutable
abstract class AmberApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const AmberApiException(this.message, {this.statusCode, this.data});

  @override
  String toString() => 'AmberApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

/// Exception for bad request (400)
class BadRequestException extends AmberApiException {
  const BadRequestException({String message = 'Bad Request', dynamic data})
    : super(message, statusCode: 400, data: data);
}

/// Exception for unauthorized access (401)
class UnauthorizedException extends AmberApiException {
  const UnauthorizedException({String message = 'Unauthorized', dynamic data})
    : super(message, statusCode: 401, data: data);
}

/// Exception for not found (404)
class NotFoundException extends AmberApiException {
  const NotFoundException({String message = 'Resource Not Found', dynamic data})
    : super(message, statusCode: 404, data: data);
}

/// Exception for server errors (5xx)
class ServerException extends AmberApiException {
  const ServerException({String message = 'Server Error', dynamic data}) : super(message, statusCode: 500, data: data);
}

/// Exception for timeouts
class TimeoutException extends AmberApiException {
  const TimeoutException({String message = 'Request Timeout'}) : super(message);
}
