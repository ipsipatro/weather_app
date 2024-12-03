import 'package:intl/intl.dart';

extension DateTimeFormatExtension on DateTime {
  String toCustomTimeFormat() {
    return DateFormat('hh.mm a').format(this);
  }
}
