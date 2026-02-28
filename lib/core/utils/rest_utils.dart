class RestUtils {
  static Uri constructUri(String baseUrl, [Map<String, dynamic>? params]) {
    final url = baseUrl.replaceAll('https://', '').replaceAll('https://', '');

    final Map<String, dynamic> urlParams = {};
    params?.forEach((key, value) {
      if (value is List) {
        if (value is List<List<String?>>) {
          final res = value.nonNulls.map((e) => _encodeList(e)).toList();
          urlParams[key] = res;
        } else if (value is List<String>) {
          final valuesMap = _encodeList(value);
          urlParams[key] = valuesMap;
        }
      } else {
        urlParams[key] = value;
      }
    });
    final encodedParams = encodeParams(urlParams);
    final fullUrl = 'https://$url$encodedParams';
    return Uri.parse(fullUrl);
  }

  static List<String> _encodeList(List<String?> value) {
    final valuesMap = value.nonNulls.map((e) => '"$e"').toList();
    return valuesMap;
  }

  static String encodeParams(Map<String, dynamic> params) {
    var s = '';
    params.forEach((key, value) {
      final urlEncode = Uri.encodeComponent(value.toString());
      s += '${s == '' ? '?' : '&'}$key=$urlEncode';
    });

    return s;
  }
}
