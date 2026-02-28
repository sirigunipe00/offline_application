import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_first/core/network/response_parser.dart';

part 'request_config.freezed.dart';

@freezed
class RequestConfig<T> with _$RequestConfig<T> {
  factory RequestConfig({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? reqParams,
    Map<String, String>? headers,
    ApiResponseParser<T>? apiResponseParser,
    String? body,
  }) = _RequestConfig<T>;
}
