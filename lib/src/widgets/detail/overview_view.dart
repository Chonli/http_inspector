import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/extensions/data.dart';
import 'package:http_inspector/src/extensions/method.dart';
import 'package:http_inspector/src/extensions/status_code.dart';
import 'package:http_inspector/src/extensions/time.dart';
import 'package:http_inspector/src/widgets/common/component_cards.dart';
import 'package:intl/intl.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key, required this.log});

  final NetworkLog log;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Metrics Row
        Row(
          mainAxisAlignment: .spaceBetween,
          mainAxisSize: .max,
          spacing: 12,
          children: [
            Expanded(
              child: InfoCard(
                icon: Icons.schedule_outlined,
                title: 'Time',
                children: [Text(DateFormat('HH:mm:ss').format(log.timestamp))],
              ),
            ),
            Expanded(
              child: InfoCard(
                icon: Icons.data_usage_outlined,
                title: 'Size',
                children: [Text(log.responseBodySize?.formatSize ?? 'N/A')],
              ),
            ),
            Expanded(
              child: InfoCard(
                icon: Icons.bolt_outlined,
                title: 'Duration',
                children: [
                  Text(
                    log.durationMs.formatMsDate,
                    style: TextStyle(color: log.durationMs.durationColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DataCard(title: 'Request Url', data: log.url),
        const SizedBox(height: 12),
        InfoCard(
          title: 'Request Details',
          backgroundColor: log.statusCode.surfaceColor,
          children: [
            InfoRow(label: 'Method', value: log.method.toText),
            if (log.statusCode != null)
              InfoRow(label: 'Status Code', value: log.statusCode.toString()),
            InfoRow(
              label: 'Timestamp',
              value: DateFormat.yMMMEd().format(log.timestamp),
            ),
          ],
        ),
        // Error
        if (log.errorMessage != null)
          InfoCard(
            icon: Icons.error_outline,
            title: 'Error',
            titleColor: Colors.red,
            children: [
              Text(
                log.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
      ],
    );
  }
}
