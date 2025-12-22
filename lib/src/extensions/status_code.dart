import 'package:flutter/material.dart';

extension StatusCodeExt on int? {
  Color get codeColor => this != null
      ? (this! >= 200 && this! < 300 ? Colors.green : Colors.orange)
      : Colors.grey;

  String get toText => this != null ? '$this' : 'N/A';
}
