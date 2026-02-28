import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BooleanUtls {
  static bool fromInt(dynamic value) {
    if(value == null) return false;
    if (value == 0) {
      return false;
    } else if (value == 1) {
      return true;
    }
    throw ArgumentError.value(value);
  }

  static int toInt(bool value) {
    return value ? 1 : 0;
  }

  static bool isAllTrue(List<dynamic> values) {
    final nonNullsLength = values.nonNulls.toList().length;
    return nonNullsLength == values.length;
  }
}

extension BoolExt on bool? {
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}

class BoolenAPIConverter implements JsonConverter<bool, int> {
  const BoolenAPIConverter();
  @override
  bool fromJson(Object json) => BooleanUtls.fromInt(json);

  @override
  int toJson(bool? object) => BooleanUtls.toInt(object ?? false);
}


class VaryingKeyConverter<T> implements JsonConverter<T, dynamic> {
  const VaryingKeyConverter({
    required this.keys,
    required this.from,
    required this.to,
  });

  final List<String> keys;
  final T Function(dynamic) from;
  final dynamic Function(T) to;

  @override
  T fromJson(dynamic json) {
    for (final key in keys) {
      if (json[key] != null) {
        return from(json[key]);
      }
    }
    throw ArgumentError('None of the provided keys found in JSON: ${keys.join(', ')}');
  }

  @override
  dynamic toJson(T object) => to(object);
}