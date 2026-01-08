# http_client_inspector

[![Pub Version](https://img.shields.io/pub/v/http_client_inspector)](https://pub.dev/packages/http_client_inspector)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
---

`http_client_inspector` is a Flutter package that provides easy logging and inspection of network activity for applications using the [http](https://pub.dev/packages/http) package. It helps developers debug and monitor HTTP requests/responses directly from their apps, providing an in-app inspector panel for real-time network analysis.

<p float="left">
  <img src="https://raw.githubusercontent.com/Chonli/http_inspector/refs/heads/main/assets/screenshot/listview.jpg" width="250">
  <img src="https://raw.githubusercontent.com/Chonli/http_inspector/refs/heads/main/assets/screenshot/detail_overview.jpg" width="250">
  <img src="https://raw.githubusercontent.com/Chonli/http_inspector/refs/heads/main/assets/screenshot/detail_response.jpg" width="250">
</p>

## Features

- **Automatic logging** of all data passed through HTTP requests using the `http` package
- **In-app inspector panel**: View detailed request, response, error, and header info directly inside your app
- **Easy integration**: Simply wrap your `http.Client` instance with an inspector
- **Supports all standard HTTP methods**
- **No special setup required**: Works with your existing codebase
- **Active only in debug by default**: Won't affect production builds

## Getting started

1. **Add dependency:**  
   Add `http_client_inspector` and `http` to your `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     http: any
     http_client_inspector: any
   ```

2. **Basic usage:**  
   You only need to initialize the inspector once in your main function:

   ```dart
   import 'package:http_client_inspector/http_client_inspector.dart';

   void main() {
     InspectorManager.init(config: InspectorConfig());
     runApp(const MyApp());
   }
   ```

   Then, wrap your HTTP client with `ClientInspector`:

   ```dart
   import 'package:http/http.dart';

   final client = ClientInspector(innerClient: Client());
   ```

   You can open the inspector panel in your app via a button that pushes `InspectorHttpPanelView()`.

   ```dart
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const InspectorHttpPanelView(),
      ),
    ),
   ```

## Usage Example

Here is a sample use case from `example/lib/main.dart`:

## 💡 Inspired By
[droido](https://github.com/kapdroid/droido) similar package but use dio instead of http client.

## RoadMap
- Add a way to exports logs (in different format)
- Create curl request corresponding to a log

## Additional information

- **License**: MIT License - see the [LICENSE](LICENSE) file for details.
- **More info**: [GitHub repository](https://github.com/Chonli/http_inspector)
- **Bug reports and feature requests**: [issue tracker](https://github.com/Chonli/http_inspector/issues)
- **Contribution**: Contributions are welcome! Please submit pull requests or open an issue for suggestions.

---

Made with ❤️ for the Flutter community.