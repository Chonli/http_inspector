import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get formatDate => DateFormat('HH:mm:ss').format(this);
}

extension IntTimeExt on int? {
  String get formatMsDate {
    if (this == null) return '--';
    return '${this}ms';
  }

  Color get durationColor => switch (this) {
    null => Colors.black,
    <= 500 => Colors.green,
    <= 2000 => Colors.orange,
    _ => Colors.red,
  };
}
