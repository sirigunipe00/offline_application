import 'package:intl/intl.dart';
import 'package:offline_first/core/core.dart';


class NumUtils {
  static NumberFormat _indianRupeesFormat([String? symbol]) => NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 2,
    symbol: symbol,
    name: '',
  );

  static String inRupeesFormat(num? value) => value.isNull 
    ? '' 
    : _indianRupeesFormat('₹ ').format(value);

  static String compactFormat(num? value) => value.isNull 
    ? '' 
    :_indianRupeesFormat().format(value);

  static String nilOrValue(num? value) {
    return value.isNull ? '-Nil-' : value.toString();
  }

  static String toStrVal(num? val) {
    if(val.isNull) {
      return '';
    } else {
      if(val is int) {
        return val.toInt().toString();
      }
      return val!.toString();
    }
  }

  static double calcGST(double base, double percent) {
    final covertedVal = percent / 100;
    final addVal = 1 + covertedVal;
    return base * addVal;
  }
}
