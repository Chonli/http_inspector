import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

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
        if (logs.isEmpty) {
          return const Center(child: Text('No network logs found.'));
        }

        return ListView.builder(
          itemCount: logs.length,
          itemBuilder: (context, index) =>
              _NetworkLogListTile(log: logs.elementAt(index)),
        );
      },
    );
  }
}

/// Small, reusable widget for displaying a single NetworkLog entry
class _NetworkLogListTile extends StatelessWidget {
  final NetworkLog log;

  const _NetworkLogListTile({required this.log});

  @override
  Widget build(BuildContext context) {
    final statusColor = log.statusCode != null
        ? (log.statusCode! >= 200 && log.statusCode! < 300
              ? Colors.green
              : Colors.orange)
        : Colors.grey;

    return ListTile(
      title: Text(
        '${log.method.toUpperCase()} ${log.url}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        log.timestamp.toIso8601String(),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: log.statusCode != null
          ? Text('${log.statusCode}', style: TextStyle(color: statusColor))
          : null,
      onTap: () {
        // TODO: Implement navigation to detailed NetworkLog page
      },
    );
  }
}
