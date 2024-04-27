import 'package:core/core.dart';
import 'package:dio/dio.dart';

extension DioExceptionX on DioException {
  GenericException toPrettyDescription() {
    switch (type) {
      case DioExceptionType.badResponse:
        switch (response?.statusCode) {
          case 400:
            return BadRequestException([response?.statusCode]);
          case 401:
            return UnauthorizedException([response?.statusCode]);
          case 404:
            return NotFoundException([response?.statusCode]);
          case 409:
            return ConflictException([response?.statusCode]);
          case 500:
            return InternalServerErrorException([response?.statusCode]);
          default:
            return GenericException(
              message: message!,
              code: response?.statusCode,
            );
        }
      case DioExceptionType.badCertificate:
        return GenericException(message: message!);
      case DioExceptionType.cancel:
        return GenericException(message: message!);
      case DioExceptionType.connectionError:
        return NoInternetConnectionException([message!]);
      case DioExceptionType.connectionTimeout:
        return GenericException(message: message!);
      case DioExceptionType.receiveTimeout:
        return GenericException(message: message!);
      case DioExceptionType.sendTimeout:
        return GenericException(message: message!);
      case DioExceptionType.unknown:
        return GenericException(message: message!);
    }
  }
}
