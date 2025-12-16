import 'package:http/http.dart';

class ClientInspector extends BaseClient {
  ClientInspector({required this.innerClient});

  final Client innerClient;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return innerClient.send(request);
  }
}
