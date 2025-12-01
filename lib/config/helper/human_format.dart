import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final formatter = NumberFormat.compact(locale: 'es_ES');
    return formatter.format(number);
  }
}
