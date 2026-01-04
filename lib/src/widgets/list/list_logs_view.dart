import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http_inspector/src/data/logs_filter.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';
import 'package:http_inspector/src/widgets/list/filters_sheet.dart';
import 'package:http_inspector/src/widgets/list/list_log_tile_view.dart';

class ListLogsView extends StatelessWidget {
  const ListLogsView({super.key});

  static final _searchQuery = ValueNotifier<String>('');
  static final _logsFilter = ValueNotifier(const LogsFilter());

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
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: "Query...",
                  onChanged: (v) => _searchQuery.value = v,
                ),
              ),
              ValueListenableBuilder<LogsFilter>(
                valueListenable: _logsFilter,
                builder: (context, filter, _) => IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: filter.noActive ? Colors.black : Colors.blue,
                  ),
                  tooltip: "Filtres",
                  onPressed: () async {
                    final newFilter = await showModalBottomSheet<LogsFilter>(
                      context: context,

                      builder: (context) => LogsFilterSheet(initial: filter),
                    );

                    if (newFilter != null && newFilter != filter) {
                      _logsFilter.value = newFilter;
                    }
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<ListQueue<NetworkLog>>(
              stream: InspectorDI.logsStream,
              builder: (context, snapshot) {
                final logs = snapshot.data ?? InspectorDI.logs;

                // TODO: voir cas du premier chargement sans donnée
                if (snapshot.connectionState == ConnectionState.waiting &&
                    logs.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ValueListenableBuilder<String>(
                  valueListenable: _searchQuery,
                  builder: (context, query, _) =>
                      ValueListenableBuilder<LogsFilter>(
                        valueListenable: _logsFilter,
                        builder: (context, filters, _) {
                          final filtered = logs.filtered(query, filters);

                          if (filtered.isEmpty) {
                            return const Center(
                              child: Text('No network logs found'),
                            );
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: filtered.length,
                            itemBuilder: (context, index) => NetworkLogListTile(
                              log: filtered.elementAt(index),
                            ),
                          );
                        },
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
