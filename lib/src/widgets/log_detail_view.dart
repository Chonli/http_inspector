import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';

class NetworkLogDetailView extends StatelessWidget {
  final NetworkLog log;

  const NetworkLogDetailView({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Network Log Details'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Request'),
              Tab(text: 'Response'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _OverviewSection(log: log),
            _RequestSection(log: log),
            _ResponseSection(log: log),
          ],
        ),
      ),
    );
  }
}

// ----------- LES SECTIONS (inchangées, même logique que précédemment)

class _OverviewSection extends StatelessWidget {
  final NetworkLog log;
  const _OverviewSection({required this.log});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DetailRow(label: 'Method', value: log.method),
        _DetailRow(label: 'URL', value: log.url),
        _DetailRow(label: 'Status', value: log.statusCode?.toString() ?? 'N/A'),
        _DetailRow(label: 'Timestamp', value: log.timestamp.toIso8601String()),
        _DetailRow(
          label: 'Duration (ms)',
          value: log.durationMs?.toString() ?? 'N/A',
        ),
        if (log.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _ErrorWidget(err: log.errorMessage!, stack: log.stackTrace),
          ),
      ],
    );
  }
}

class _RequestSection extends StatelessWidget {
  final NetworkLog log;
  const _RequestSection({required this.log});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _HeadersWidget(headers: log.requestHeaders),
        const SizedBox(height: 10),
        _DetailRow(label: 'Body', value: log.requestBody?.toString() ?? 'N/A'),
        _DetailRow(
          label: 'Size (bytes)',
          value: log.requestBodySize?.toString() ?? 'N/A',
        ),
      ],
    );
  }
}

class _ResponseSection extends StatelessWidget {
  final NetworkLog log;
  const _ResponseSection({required this.log});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _HeadersWidget(headers: log.responseHeaders),
        const SizedBox(height: 10),
        _DetailRow(label: 'Body', value: log.responseBody?.toString() ?? 'N/A'),
        _DetailRow(
          label: 'Size (bytes)',
          value: log.responseBodySize?.toString() ?? 'N/A',
        ),
      ],
    );
  }
}

// ----------- UTILITAIRES (identiques à la suggestion précédente)

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: SelectableText(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 15,
            minLines: 1,
          ),
        ),
      ],
    );
  }
}

class _HeadersWidget extends StatelessWidget {
  final Map<String, dynamic>? headers;
  const _HeadersWidget({this.headers});

  @override
  Widget build(BuildContext context) {
    if (headers == null || headers!.isEmpty) {
      return const _DetailRow(label: 'Headers', value: 'N/A');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Headers:',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        ...headers!.entries.map(
          (e) => _DetailRow(label: e.key, value: e.value.toString()),
        ),
      ],
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String err;
  final StackTrace? stack;
  const _ErrorWidget({required this.err, this.stack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Error!',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          err,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
        if (stack != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              stack.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.red.shade300,
                fontFamily: 'monospace',
              ),
            ),
          ),
      ],
    );
  }
}
