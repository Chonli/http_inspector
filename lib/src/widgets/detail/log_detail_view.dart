import 'package:flutter/material.dart';
import 'package:http_client_inspector/src/data/network_log.dart';
import 'package:http_client_inspector/src/widgets/detail/overview_view.dart';
import 'package:http_client_inspector/src/widgets/detail/request_view.dart';
import 'package:http_client_inspector/src/widgets/detail/response_view.dart';

class NetworkLogDetailView extends StatelessWidget {
  final NetworkLog log;

  const NetworkLogDetailView({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Request Details'),
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
            OverviewSection(log: log),
            RequestSection(log: log),
            ResponseSection(log: log),
          ],
        ),
      ),
    );
  }
}
