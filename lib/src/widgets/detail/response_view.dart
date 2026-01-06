import 'package:flutter/material.dart';
import 'package:http_client_inspector/src/core/data_utils.dart';
import 'package:http_client_inspector/src/data/network_log.dart';
import 'package:http_client_inspector/src/widgets/common/component_cards.dart';

class ResponseSection extends StatelessWidget {
  const ResponseSection({super.key, required this.log});

  final NetworkLog log;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        if (log.responseHeaders?.isNotEmpty == true) ...[
          InfoCard(
            title: 'Response Headers',
            children: log.responseHeaders!.entries
                .map((e) => InfoRow(label: e.key, value: e.value.toString()))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],

        if (log.responseBody != null)
          DataCard(
            title: 'Response Body',
            data: DataUtils.jsonDataFormated(log.responseBody),
          )
        else
          const EmptyCard(message: 'No response body'),
      ],
    );
  }
}
