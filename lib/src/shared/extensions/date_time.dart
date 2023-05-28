import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  String get toYyyyMmDd => DateFormat('yyyy-MM-dd').format(this);
}
