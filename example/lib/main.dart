import 'dart:async';
import 'dart:convert';
import 'dart:developer' show log;
import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_inspector/http_inspector.dart';

void main() {
  InspectorManager.init(config: const InspectorConfig());

  runApp(const MainApp());
}

class ApiClient {
  /// Wrap client http with ClientInspector to log data
  ApiClient(Client client) : innerClient = ClientInspector(innerClient: client);

  final Client innerClient;

  static const List<(String, String, Map<String, dynamic>)> urls = [
    ('GET', 'https://dummyjson.com/recipes', {}),
    ('GET', 'https://dummyjson.com/products/search?q=phone', {}),
    ('GET', 'https://dummyjson.com/users?limit=10', {}),
    ('GET', 'https://dummyjson.com/recipes/5', {}),
    ('GET', 'https://dummyjson.com/http/404/Hello_Peter', {}),
    ('GET', 'https://dummyjson.com/http/304/Move_Data', {}),
    ('GET', 'https://dummyjson.com/http/501/Internal_error', {}),
    ('DELETE', 'https://dummyjson.com/recipes/1', {}),
    ('DELETE', 'https://dummyjson.com/products/1', {}),
    ('PUT', 'https://dummyjson.com/recipes/1', {'name': 'Tasty Pizza'}),
    ('POST', 'https://dummyjson.com/products/add', {'title': 'BMW Pencil'}),
    ('POST', 'https://dummyjson.com/recipes/add', {'name': 'Pizza napolitana'}),
  ];

  Future<void> simulateApi() async {
    final data = urls[Random().nextInt(urls.length)];

    final ret = switch (data.$1) {
      'GET' => await innerClient.get(Uri.parse(data.$2)),
      'PUT' => await innerClient.put(
        Uri.parse(data.$2),
        body: jsonEncode(data.$3),
      ),
      'DELETE' => await innerClient.delete(Uri.parse(data.$2)),
      _ => await innerClient.post(
        Uri.parse(data.$2),
        body: jsonEncode(data.$3),
      ),
    };

    log('${data.$1} ${data.$2} -> return code: ${ret.statusCode}');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _HomeView(apiClient: ApiClient(Client())));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({required this.apiClient});

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Inspector Test'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bug_report),
            tooltip: 'Inspector panel',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const InspectorHttpPanelView(),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            OutlinedButton(
              onPressed: () => apiClient.simulateApi(),
              child: const Text('Simulate Download'),
            ),
            OutlinedButton(
              onPressed: () {
                var count = 20;
                Timer.periodic(const Duration(seconds: 20), (timer) async {
                  await apiClient.simulateApi();
                  count--;
                  if (count < 0) timer.cancel();
                });
              },
              child: const Text('Periodic Download'),
            ),
          ],
        ),
      ),
    );
  }
}
