import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';
import 'package:http_inspector/src/widgets/list/list_log_tile_view.dart';

class ListLogsView extends StatelessWidget {
  const ListLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!InspectorDI.isActive) {
      return const Center(child: Text('Package is inactive'));
    }

    return StreamBuilder<ListQueue<NetworkLog>>(
      stream: InspectorDI.logsStream,
      builder: (context, snapshot) {
        final logs = snapshot.data ?? InspectorDI.logs;

        if (snapshot.connectionState == ConnectionState.waiting &&
            logs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // TODO add filters and searchbar

        if (logs.isEmpty) {
          return const Center(child: Text('No network logs found.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: logs.length,
          itemBuilder: (context, index) =>
              NetworkLogListTile(log: logs.elementAt(index)),
        );
      },
    );
  }
}
