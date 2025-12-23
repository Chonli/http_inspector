import 'dart:convert';

class DataUtils {
  static String jsonDataFormated(dynamic data) {
    late String formatted;

    try {
      if (data is String) {
        final decoded = jsonDecode(data);
        formatted = const JsonEncoder.withIndent('  ').convert(decoded);
      } else {
        formatted = const JsonEncoder.withIndent('  ').convert(data);
      }
    } catch (_) {
      formatted = data.toString();
    }
    return formatted;
  }
}
