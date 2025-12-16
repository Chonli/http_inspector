import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';

/// A page widget that displays a list of NetworkLog entries
class PanelView extends StatelessWidget {
  const PanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = <NetworkLog>[];

    return Scaffold(
      appBar: AppBar(title: const Text('Network Logs')),
      body: logs.isEmpty
          ? const Center(child: Text('No network logs found.'))
          : ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) =>
                  _NetworkLogListTile(log: logs[index]),
            ),
    );
  }
}

/// Small, reusable widget for displaying a single NetworkLog entry
class _NetworkLogListTile extends StatelessWidget {
  final NetworkLog log;

  const _NetworkLogListTile({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final statusColor = log.statusCode != null
        ? (log.statusCode! >= 200 && log.statusCode! < 300
              ? Colors.green
              : Colors.red)
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
