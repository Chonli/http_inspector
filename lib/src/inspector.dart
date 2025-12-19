import 'package:http/http.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

class ClientInspector extends BaseClient {
  ClientInspector({required this.innerClient});

  final Client innerClient;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (!InspectorDI.isActive) {
      return innerClient.send(request);
    }

    final response = await innerClient.send(request);
    final log = NetworkLog(
      id: '${request.hashCode}',
      url: request.url.toString(),
      method: request.method,
      timestamp: DateTime.now(),
    );

    InspectorDI.addLog(log);

    return response;
  }
}
