import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';

/// Page to display detailed information about a NetworkLog
class NetworkLogDetailView extends StatelessWidget {
  final NetworkLog log;

  const NetworkLogDetailView({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Log Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _DetailRow(label: 'Method', value: log.method),
            _DetailRow(label: 'URL', value: log.url),
            _DetailRow(
              label: 'Status',
              value: log.statusCode?.toString() ?? 'N/A',
            ),
            _DetailRow(
              label: 'Timestamp',
              value: log.timestamp.toIso8601String(),
            ),
            _DetailRow(
              label: 'Duration (ms)',
              value: log.durationMs != null ? log.durationMs.toString() : 'N/A',
            ),
            const Divider(),
            _DetailRow(
              label: 'Request Headers',
              value: log.requestHeaders?.toString() ?? 'N/A',
            ),
            _DetailRow(
              label: 'Request Body',
              value: log.requestBody?.toString() ?? 'N/A',
            ),
            const Divider(),
            _DetailRow(
              label: 'Response Headers',
              value: log.responseHeaders?.toString() ?? 'N/A',
            ),
            _DetailRow(
              label: 'Response Body',
              value: log.responseBody?.toString() ?? 'N/A',
            ),
            if (log.errorMessage != null) ...[
              const Divider(),
              _DetailRow(label: 'Error Message', value: log.errorMessage!),
              if (log.stackTrace != null)
                _DetailRow(
                  label: 'Stack Trace',
                  value: log.stackTrace.toString(),
                ),
            ],

            // Add more fields if needed
          ],
        ),
      ),
    );
  }
}

/// Simple key-value row widget
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
