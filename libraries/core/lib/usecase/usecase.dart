import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<GenericException, Type>> call(Params params);
}
