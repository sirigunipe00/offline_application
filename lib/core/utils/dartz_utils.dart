import 'dart:async';
import 'package:dartz/dartz.dart';


extension EitherExtensions<Failure, R> on Either<Failure, R> {

  Either<Failure, T> process<T>(Either<Failure, T> Function(R r) ifRight) {
    return fold(left, (R r) => ifRight(r));
  }

  FutureOr<Either<Failure, T>> processAsync<T>(FutureOr<Either<Failure, T>> Function(R r) ifRight) {
    return fold(left, (R r) => ifRight(r));
  }

  Failure getLeft() => fold((Failure l) => l, (R r) => throw Exception('unexpected state'));
}