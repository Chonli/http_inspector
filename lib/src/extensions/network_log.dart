import 'dart:collection';

import 'package:http_inspector/src/data/network_log.dart';

extension NetworkLogListExt on ListQueue<NetworkLog> {
  ListQueue<NetworkLog> filtered(String query) {
    final queryLowerCase = query.toLowerCase();

    return queryLowerCase.isEmpty
        ? this
        : ListQueue<NetworkLog>.from(
            where(
              (log) =>
                  log.url.toLowerCase().contains(queryLowerCase) ||
                  log.method.toLowerCase().contains(queryLowerCase) ||
                  log.statusCode.toString().contains(queryLowerCase),
            ),
          );
  }
}
