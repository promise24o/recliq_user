import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = ServerFailure;
  const factory Failure.networkError() = NetworkFailure;
  const factory Failure.invalidInput([String? message]) = InvalidInputFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.notFound() = NotFoundFailure;
  const factory Failure.unexpected([String? message]) = UnexpectedFailure;
}
