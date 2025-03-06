import 'package:consulto/core/errors/error_model.dart';
import 'package:dio/dio.dart';

/// Base class for all exceptions
abstract class ServerException implements Exception {
  final ErrorModel errorModel;
  const ServerException(this.errorModel);
}

class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}

/// Specific exceptions for different error cases
class ForbiddenException extends ServerException {
  const ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  const NotFoundException(super.errorModel);
}

class BadRequestException extends ServerException {
  const BadRequestException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException(super.errorModel);
}

class ConflictException extends ServerException {
  const ConflictException(super.errorModel);
}

class TimeoutException extends ServerException {
  const TimeoutException(super.errorModel);
}

class ConnectionException extends ServerException {
  const ConnectionException(super.errorModel);
}

class UnknownException extends ServerException {
  const UnknownException(super.errorModel);
}

class CancelledRequestException extends ServerException {
  const CancelledRequestException(super.errorModel);
}

class SSLCertificateException extends ServerException {
  const SSLCertificateException(super.errorModel);
}

/// Handles Dio exceptions and converts them into our custom exceptions
Never handleDioExceptions(DioException e) {
  if (e.response != null) {
    final errorModel = ErrorModel.fromJson(e.response!.data);

    switch (e.response!.statusCode) {
      case 400:
        throw BadRequestException(errorModel);
      case 401:
        throw UnauthorizedException(errorModel);
      case 403:
        throw ForbiddenException(errorModel);
      case 404:
        throw NotFoundException(errorModel);
      case 409:
        throw ConflictException(errorModel);
      case 408:
      case 504:
        throw TimeoutException(errorModel);
      default:
        throw UnknownException(errorModel);
    }
  } else {
    // Handle cases where there is no response (network errors, timeouts, etc.)
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(
            ErrorModel(status: 408, errorMessage: "Request timed out."));
      case DioExceptionType.connectionError:
        throw ConnectionException(
            ErrorModel(status: 503, errorMessage: "No internet connection."));
      case DioExceptionType.cancel:
        throw CancelledRequestException(
            ErrorModel(status: 499, errorMessage: "Request was cancelled."));
      case DioExceptionType.badCertificate:
        throw SSLCertificateException(
            ErrorModel(status: 495, errorMessage: "Invalid SSL certificate."));
      case DioExceptionType.unknown:
      default:
        throw UnknownException(
            ErrorModel(status: 520, errorMessage: "An unknown error occurred."));
    }
  }
}
