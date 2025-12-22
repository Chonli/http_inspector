import 'dart:convert';
import 'dart:developer' show log;
import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_inspector/http_inspector.dart';

void main() {
  InspectorManager.init(config: InspectorConfig());

  runApp(MainApp(apiClient: ApiClient(Client())));
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
    ('GET', 'https://dummyjson.com/products/5', {}),
    ('GET', 'https://dummyjson.com/error', {}),
    ('POST', 'https://dummyjson.com/products/add', {'title': 'BMW Pencil'}),
    ('POST', 'https://dummyjson.com/recipes/add', {'name': 'Pizza napolitana'}),
  ];

  Future<void> simulateApi() async {
    final data = urls[Random().nextInt(urls.length)];

    final ret = switch (data.$1) {
      'GET' => await innerClient.get(Uri.parse(data.$2)),
      _ => await innerClient.post(
        Uri.parse(data.$2),
        body: jsonEncode(data.$3),
      ),
    };

    log('GET ${data.$2} -> return code: ${ret.statusCode}');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.apiClient});

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http Inspector Test'),
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
          child: OutlinedButton(
            onPressed: () => apiClient.simulateApi(),
            child: const Text('Simulate Download'),
          ),
        ),
      ),
    );
  }
}
