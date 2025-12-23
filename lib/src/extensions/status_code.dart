import 'package:flutter/material.dart';

extension StatusCodeExt on int? {
  Color get codeColor => switch (this) {
    null => Colors.grey,
    < 400 => Colors.green,
    < 500 => Colors.orange,
    _ => Colors.red,
  };

  Color get surfaceColor => switch (this) {
    null => Colors.white,
    < 400 => Colors.white,
    < 500 => Colors.orange.withAlpha(30),
    _ => Colors.red.withAlpha(30),
  };

  String get toText => this != null ? '$this' : 'N/A';
}
