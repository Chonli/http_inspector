import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';
import 'package:http_inspector/src/extensions/network_log.dart';
import 'package:http_inspector/src/widgets/list/list_log_tile_view.dart';

class ListLogsView extends StatelessWidget {
  const ListLogsView({super.key});

  static final ValueNotifier<String> _searchQuery = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    if (!InspectorDI.isActive) {
      return const Center(child: Text('Package is inactive'));
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 12,
        children: [
          SearchBar(
            leading: const Icon(Icons.search),
            hintText: "Query...",
            onChanged: (v) => _searchQuery.value = v,
          ),
          Expanded(
            child: StreamBuilder<ListQueue<NetworkLog>>(
              stream: InspectorDI.logsStream,
              builder: (context, snapshot) {
                final logs = snapshot.data ?? InspectorDI.logs;

                if (snapshot.connectionState == ConnectionState.waiting &&
                    logs.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ValueListenableBuilder<String>(
                  valueListenable: _searchQuery,
                  builder: (context, query, _) {
                    final filtered = logs.filtered(query);

                    if (filtered.isEmpty) {
                      return const Center(
                        child: Text('Aucune requête réseau trouvée.'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) =>
                          NetworkLogListTile(log: filtered.elementAt(index)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
