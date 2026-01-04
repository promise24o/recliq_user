import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = ServerFailure;
  const factory Failure.networkError([String? message]) = NetworkFailure;
  const factory Failure.invalidInput([String? message]) = InvalidInputFailure;
  const factory Failure.unauthorized([String? message]) = UnauthorizedFailure;
  const factory Failure.forbidden([String? message]) = ForbiddenFailure;
  const factory Failure.notFound([String? message]) = NotFoundFailure;
  const factory Failure.cacheError([String? message]) = CacheFailure;
  const factory Failure.unexpected([String? message]) = UnexpectedFailure;
}
