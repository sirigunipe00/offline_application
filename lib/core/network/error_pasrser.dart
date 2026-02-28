import 'dart:convert';

String defaultErrorParser(
    Map<String, dynamic> response, String defErrorMessage) {
  try {
    if (response.containsKey('_server_messages')) {
      final serverMsgs =
          json.decode(response['_server_messages']) as List<dynamic>;
      if (serverMsgs.isNotEmpty) {
        final messageData = json.decode(serverMsgs.first);
        final errorMsg = messageData['message'];
        return errorMsg;
      }
    }
    if (response.containsKey('exception')) {
      final errorMsg = response['message'];
      final exception = response['exception'];
      return errorMsg ?? exception;
    } else {
      return defErrorMessage;
    }
  } on Exception catch (_) {
    throw const FormatException('Unrecognized json error response');
  }
}
