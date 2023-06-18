import 'package:flutter/material.dart';

String get24hourformat(int hour, int minute) {
  if (hour < 12 && TimeOfDay == DayPeriod.pm) {
    hour = hour + 12;
  } else if (hour < 12 && TimeOfDay == DayPeriod.am) {
    hour = hour - 12;
  }
  return '${hour < 12 ? hour < 9 ? '0' + hour.toString() : hour.toString() : hour} : ${minute}';
}
