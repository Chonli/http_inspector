import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';

extension HttpMethodStringExt on String {
  HttpMethod get toEnum => switch (toUpperCase()) {
    'GET' => .get,
    'HEAD' => .head,
    'POST' => .post,
    'PUT' => .put,
    'DELETE' => .delete,
    'PATCH' => .patch,
    'OPTIONS' => .options,
    'TRACE' => .trace,
    'CONNECT' => .connect,

    _ => .unknown,
  };
}

extension HttpMethodExt on HttpMethod {
  Color get toColor => switch (this) {
    .get || .head => Colors.blue,
    .post => Colors.green,
    .put => Colors.deepPurple,
    .delete => Colors.red,
    .patch => Colors.orange,
    _ => Colors.grey,
  };

  String get toText => switch (this) {
    .get => 'GET',
    .post => 'POST',
    .put => 'PUT',
    .delete => 'DELETE',
    .patch => 'PATCH',
    .head => 'HEAD',
    .options => 'OPTIONS',
    .trace => 'TRACE',
    .connect => 'CONNECT',
    .unknown => 'UNKNOWN',
  };
}
