import 'package:core/constant/error_string.dart';
import 'package:equatable/equatable.dart';

class GenericException extends Equatable implements Exception {
  final String message;
  final Object? code;

  const GenericException({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

class FetchDataException extends GenericException {
  const FetchDataException([message])
      : super(
          message: ErrorString.fetchDataException,
        );
}

class BadRequestException extends GenericException {
  const BadRequestException([code])
      : super(
          message: "${ErrorString.badRequestException} (statuscode:$code)",
        );
}

class UnauthorizedException extends GenericException {
  const UnauthorizedException([code])
      : super(
          message: "${ErrorString.unauthorizedException} (statuscode:$code)",
        );
}

class NotFoundException extends GenericException {
  const NotFoundException([code])
      : super(
          message: "${ErrorString.notFoundException} (statuscode:$code)",
        );
}

class ConflictException extends GenericException {
  const ConflictException([code])
      : super(
          message: "${ErrorString.conflictException} (statuscode:$code)",
        );
}

class InternalServerErrorException extends GenericException {
  const InternalServerErrorException([code])
      : super(
          message:
              "${ErrorString.internalServerErrorException} (statuscode:$code)",
        );
}

class NoInternetConnectionException extends GenericException {
  const NoInternetConnectionException([message])
      : super(
          message: ErrorString.noNetworkConnectionException,
        );
}

class CacheException extends GenericException {
  const CacheException([message])
      : super(
          message: ErrorString.cacheException,
        );
}
