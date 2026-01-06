import 'package:flutter/material.dart';
import 'package:http_client_inspector/src/core/data_utils.dart';
import 'package:http_client_inspector/src/data/network_log.dart';
import 'package:http_client_inspector/src/widgets/common/component_cards.dart';

class RequestSection extends StatelessWidget {
  const RequestSection({super.key, required this.log});

  final NetworkLog log;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        if (log.requestHeaders?.isNotEmpty == true) ...[
          InfoCard(
            title: 'Request Headers',
            children: log.requestHeaders!.entries
                .map((e) => InfoRow(label: e.key, value: e.value.toString()))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],

        if (log.requestBody != null && log.requestBody.isNotEmpty)
          DataCard(
            title: 'Request Body',
            data: DataUtils.jsonDataFormated(log.requestBody),
          )
        else
          const EmptyCard(message: 'No request body'),
      ],
    );
  }
}
