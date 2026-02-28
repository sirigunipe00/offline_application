
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/core.dart';


typedef ApiCall<T> = Future<ApiResponse<T>> Function(RequestConfig<T> config);
typedef StandardApiResponse<T> = Future<Either<Failure, ApiResponse<T>>>;

class BaseApiRepository {
  const BaseApiRepository(this.client);

  final ApiClient client;

  StandardApiResponse<T> get<T>(RequestConfig<T> params,
      {bool includeAuthHeader = true}) async {
    try {
      return _request(client.get, params, includeAuthHeader: includeAuthHeader);
    } on Exception catch (e, st) {
      $logger.error('[Api Failure]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  StandardApiResponse<T> post<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async =>
      _request(client.post, params, includeAuthHeader: includeAuthHeader);

  StandardApiResponse<T> put<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async =>
      _request(client.put, params, includeAuthHeader: includeAuthHeader);

  StandardApiResponse<T> multiPart<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async {
    return _request(client.multipartRequest, params,
        includeAuthHeader: includeAuthHeader);
  }

  AsyncValueOf<Uint8List> downloadFile(String url) async {

    String baseUrl;

    if (Urls.isTest) {
       baseUrl = 'https://m11ucouat.easycloud.co.in/';
    } else {
      baseUrl = 'https://rucoprd.sunpure.in/';
    }
    // const String baseUrl = 'https://m11ucouat.easycloud.co.in//';
    // // const String baseUrl = 'https://rucoprd.sunpure.in//';
  //  
    if (!url.startsWith(baseUrl)) {
      url = baseUrl + url;
    }

    final res = await client.downloadFile(url);
    return res;
  }

   Map<String, dynamic> removeNullValues(Map<String, dynamic> map) {
    map.removeWhere((key, value) => value == null);
    Map<String, dynamic> stringifiedMap = {};

    map.forEach((key, value) {
      if (value is! File) {
        stringifiedMap[key] = value;
      } else {
        stringifiedMap[key] = value;
      }
    });
    return stringifiedMap;
  }

  StandardApiResponse<T> _request<T>(
      ApiCall<T> apiCall, RequestConfig<T> config,
      {bool includeAuthHeader = true}) async {
    try {
      final commonHeaders = <String, dynamic>{
        HttpHeaders.contentTypeHeader: 'application/json'
      };
      if (includeAuthHeader) {
        final cookie = await _getAuthHeader();
        commonHeaders.addAll(cookie);
      }

      final RequestConfig<T> requestConfig = config.copyWith(
        headers: {...config.headers ?? {}, ...commonHeaders},
      );

      final ApiResponse<T> response = await apiCall(requestConfig);

      if (response.isFailed()) {
        return left(Failure(error: response.error!));
      }

      return right(response);
    } on BaseApiException catch (e, _) {
      return left(Failure(error: e.message));
    } on Exception catch (e, st) {
      $logger
        ..info('Log 2')
        ..error(e.toString(), e, st);

      return left(Failure(error: e.toString()));
    }
  }

  LoggedInUser user() => $sl.get<LoggedInUser>();

  Future<Map<String, dynamic>> _getAuthHeader() async {
    if ($sl.isRegistered<LoggedInUser>()) {
      final user = $sl.get<LoggedInUser>();
      final apiKey = user.apiKey;
      final apiSecret = user.apiSecret;
      if (apiKey.doesNotHaveValue || apiSecret.doesNotHaveValue) return {};
      return {HttpHeaders.authorizationHeader: 'token $apiKey:$apiSecret'};
    }
    return {};
  }

  AsyncValueOf<T> executeSafely<T>(AsyncValueOf<T> Function() asyncFunction) {
    return AppTaskEither.tryCatch(
      () async {
        final result = await asyncFunction();
        return result.fold((failure) => throw failure.error, (value) => value);
      },
      (error, stack) {
        $logger
          ..error('[BaseApiRepo]', error, stack)
          ..info(stack);
        return Failure(error: error.toString());
      },
    ).run();
  }
}
