import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/extensions/data.dart';
import 'package:http_inspector/src/extensions/method.dart';
import 'package:http_inspector/src/extensions/status_code.dart';
import 'package:http_inspector/src/extensions/time.dart';
import 'package:http_inspector/src/widgets/detail/log_detail_view.dart';

class NetworkLogListTile extends StatelessWidget {
  final NetworkLog log;

  const NetworkLogListTile({super.key, required this.log});

  @Preview(name: 'NetworkLogListTile', group: 'List')
  static Widget preview() {
    return NetworkLogListTile(
      log: NetworkLog(
        id: 'id',
        url: 'https://wwww.exemple.com/produit',
        method: HttpMethod.get,
        timestamp: DateTime(2025, 12, 22, 12),
        durationMs: 204,
        responseBody: 'responseBody',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = log.statusCode.codeColor;
    final sufaceColor = log.statusCode.surfaceColor;

    return Padding(
      padding: const .only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: sufaceColor,
          borderRadius: .circular(8),
          border: .all(color: statusColor.withAlpha(30), width: 2),
        ),
        child: ListTile(
          title: Row(
            spacing: 4,
            mainAxisAlignment: .spaceBetween,
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
            padding: const .only(top: 8),
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
      ),
    );
  }
}

class _MethodText extends StatelessWidget {
  const _MethodText(this.method);

  final HttpMethod method;

  @override
  Widget build(BuildContext context) {
    final color = method.toColor;

    return _BackgroundCard(
      color: color,
      child: Text(
        method.toText,
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

    return _BackgroundCard(
      color: color,
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

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: child,
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
