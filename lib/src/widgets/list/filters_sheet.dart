import 'package:flutter/material.dart';
import 'package:http_client_inspector/src/data/logs_filter.dart';
import 'package:http_client_inspector/src/data/network_log.dart';
import 'package:http_client_inspector/src/extensions/method.dart';

const _allText = 'ALL';

class LogsFilterSheet extends StatefulWidget {
  final LogsFilter initial;
  const LogsFilterSheet({super.key, required this.initial});

  @override
  State<LogsFilterSheet> createState() => LogsFilterSheetState();
}

class LogsFilterSheetState extends State<LogsFilterSheet> {
  late Set<String> _methods = {
    if (widget.initial.methods.length >= 5)
      _allText
    else
      ...widget.initial.methods.map((e) => e.toText),
  };
  late Set<StatusGroup> _status = {...widget.initial.statusGroup};
  late Set<DurationGroup> _duration = {...widget.initial.durationGroup};

  static const _displayMethod = <String>[
    _allText,
    'GET',
    'POST',
    'PUT',
    'DELETE',
    'PATCH',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Center(
            child: Text('Filters', style: TextStyle(fontWeight: .bold)),
          ),
          Wrap(
            spacing: 8,
            children: _displayMethod.map((m) {
              final selected = _methods.contains(m);
              return FilterChip(
                label: Text(m),
                selected: selected,
                onSelected: (_) => setState(() {
                  if (m == _allText) {
                    _methods = {_allText};
                  } else {
                    if (_methods.contains(m)) {
                      _methods.remove(m);
                    } else {
                      _methods.add(m);
                    }

                    _methods.remove(_allText);
                  }
                }),
              );
            }).toList(),
          ),
          const Divider(),
          Wrap(
            spacing: 8,
            children: StatusGroup.values.map((e) {
              final selected = _status.contains(e);
              return FilterChip(
                label: Text(e.toText),
                selected: selected,
                onSelected: (_) => setState(() {
                  if (e == .all) {
                    _status = {StatusGroup.all};
                  } else {
                    if (_status.contains(e)) {
                      _status.remove(e);
                    } else {
                      _status.add(e);
                    }

                    _status.remove(StatusGroup.all);
                  }
                }),
              );
            }).toList(),
          ),
          const Divider(),
          Wrap(
            spacing: 8,
            children: DurationGroup.values.map((e) {
              final selected = _duration.contains(e);
              return FilterChip(
                label: Text(e.toText),
                selected: selected,
                onSelected: (_) => setState(() {
                  if (e == .all) {
                    _duration = {DurationGroup.all};
                  } else {
                    if (_duration.contains(e)) {
                      _duration.remove(e);
                    } else {
                      _duration.add(e);
                    }

                    _duration.remove(DurationGroup.all);
                  }
                }),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, null),
                child: const Text("Cancel"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  final methods = _methods.contains('ALL')
                      ? HttpMethod.values
                      : _methods.map((e) => e.toEnum);

                  Navigator.pop(
                    context,
                    LogsFilter(
                      methods: methods.toSet(),
                      statusGroup: _status,
                      durationGroup: _duration,
                    ),
                  );
                },
                child: const Text("Apply"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
