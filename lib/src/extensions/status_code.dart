import 'package:flutter/material.dart';

extension StatusCodeExt on int? {
  Color get codeColor => this != null
      ? (this! >= 200 && this! < 300 ? Colors.green : Colors.orange)
      : Colors.grey;

  Color get surfaceColor => switch (this) {
    null => Colors.white,
    >= 400 => Colors.orange.withAlpha(30),
    _ => Colors.white,
  };

  String get toText => this != null ? '$this' : 'N/A';
}
