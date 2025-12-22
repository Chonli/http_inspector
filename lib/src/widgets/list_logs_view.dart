import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';
import 'package:http_inspector/src/extensions/data.dart';
import 'package:http_inspector/src/extensions/method.dart';
import 'package:http_inspector/src/extensions/status_code.dart';
import 'package:http_inspector/src/extensions/time.dart';
import 'package:http_inspector/src/widgets/log_detail_view.dart';

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
          padding: const EdgeInsets.all(12),
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
    final statusColor = log.statusCode.codeColor;
    final sufaceColor = log.statusCode.surfaceColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: sufaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withAlpha(30), width: 2),
      ),
      child: ListTile(
        title: Row(
          spacing: 4,
          children: [
            _MethodText(log.method),
            Flexible(
              child: Text(
                log.url,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            _StatusText(log.statusCode),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            spacing: 4,
            mainAxisAlignment: .spaceBetween,
            children: [
              _InfoItem(
                icon: Icons.access_time_rounded,
                label: 'Time',
                value: log.timestamp.formatDate,
              ),
              _InfoItem(
                icon: Icons.data_usage,
                label: 'Response size',
                value: log.responseBodySize?.formatSize ?? 'N/A',
              ),
              _InfoItem(
                icon: Icons.timer_outlined,
                label: 'Duration',
                value: log.durationMs.formatMsDate,
                colorText: log.durationMs.durationColor,
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => NetworkLogDetailView(log: log),
          ),
        ),
      ),
    );
  }
}

class _MethodText extends StatelessWidget {
  const _MethodText(this.method);

  final String method;

  @override
  Widget build(BuildContext context) {
    final color = method.methodColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        method,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StatusText extends StatelessWidget {
  const _StatusText(this.status);

  final int? status;

  @override
  Widget build(BuildContext context) {
    final color = status.codeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.toText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.colorText = Colors.black,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 4,
          children: [
            Icon(icon, size: 12, color: Colors.grey),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: colorText,
          ),
        ),
      ],
    );
  }
}
