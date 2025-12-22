import 'package:flutter/material.dart';

extension HttpMethodExt on String {
  Color get methodColor => switch (this) {
    'GET' => Colors.blue,
    'POST' => Colors.green,
    'UPDATE' => Colors.deepPurple,
    'DELETE' => Colors.red,
    'PATCH' => Colors.orange,
    _ => Colors.grey,
  };
}
