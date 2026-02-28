import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:offline_first/core/cubit/base/base_cubit.dart';
import 'package:offline_first/core/logger/app_logger.dart';
import 'package:offline_first/core/model/failure.dart';

part 'network_request_cubit.freezed.dart';

class NetworkRequestCubit<T, RP> extends AppBaseCubit<NetworkRequestState<T>> {
  NetworkRequestCubit({required this.onRequest})
    : super(_NetworkRequestInitial<T>());

  final Future<Either<Failure, T>> Function(
    RP? params,
    NetworkRequestState<T> state,
  )
  onRequest;

  Future<void> request([RP? params]) async {
    emitSafeState(_NetworkRequestLoading<T>());
    try {
      final result = await onRequest(params, state);
      return result.fold(
        (l) => emitSafeState(_NetworkRequestFailure<T>(l)),
        (r) => emitSafeState(_NetworkRequestSuccess<T>(r)),
      );
    } on Exception catch (e, st) {
      $logger.error('[NetworkRequestCubit]', e, st);
      final failure = Failure(error: e.toString());
      emitSafeState(_NetworkRequestFailure<T>(failure));
    }
  }
}

@freezed
class NetworkRequestState<T> with _$NetworkRequestState<T> {
  const NetworkRequestState._();

  const factory NetworkRequestState.initial() = _NetworkRequestInitial<T>;

  const factory NetworkRequestState.loading() = _NetworkRequestLoading<T>;

  const factory NetworkRequestState.success(T data) = _NetworkRequestSuccess<T>;

  const factory NetworkRequestState.failure(Failure failure) =
      _NetworkRequestFailure<T>;

  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);
}
