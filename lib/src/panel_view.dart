import 'package:flutter/material.dart';
import 'package:http_client_inspector/src/widgets/list/list_logs_view.dart';

/// A page widget that displays a list of NetworkLog entries
class InspectorHttpPanelView extends StatelessWidget {
  const InspectorHttpPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Logs')),
      body: const ListLogsView(),
    );
  }
}
