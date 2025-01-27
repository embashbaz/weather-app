

import 'package:intl/intl.dart';

extension IntTimeExtension on int {
  DateTime getDateTimeFromInt() {
    return DateTime.fromMillisecondsSinceEpoch((this * 1000), isUtc: true);
  }

  /// This function return you a time on 1/1/1970, with the time in miliseconds passed

  DateTime getEpochDateWithATimeFromTimeInt() {
    Duration duration = Duration(milliseconds: this);
    DateTime epoch = DateTime.utc(1970);
    DateTime dateTime = epoch.add(duration);
    return dateTime;
  }

  String getJustDate() => getDateTimeFromInt().getJustDate();

  String getJustTime() => getDateTimeFromInt().getJustTime();
}

extension DateTimeExtention on DateTime {
  int get toInt => millisecondsSinceEpoch;

  String getFormatedTime() {
    var time = toLocal();
    return DateFormat.yMMMEd().add_jm().format(time);
  }

  String getJustDate() {
    var time = toLocal();
    return DateFormat.yMMMEd().format(time);
  }

  String getJustTime() {
    var time = toLocal();
    return DateFormat.jm().format(time);
  }

}