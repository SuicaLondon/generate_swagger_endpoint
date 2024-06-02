import 'package:intl/intl.dart';

class SwaggerReader {
  Map<String, dynamic> swaggerJson;
  SwaggerReader({required this.swaggerJson})
      : assert(swaggerJson['paths'] != null,
            'Please input a valid swagger json file');

  List<String> readEndpoints() {
    assert(
        swaggerJson['paths'] != null, 'Please input a valid swagger json file');
    final Map<String, dynamic> pathMap = swaggerJson['paths'];
    final List<String> endpoints = <String>[];
    pathMap.forEach((String url, value) {
      final Map<String, dynamic> urlValue = value;
      for (final String method in urlValue.keys) {
        final String propertyName = method.toLowerCase() +
            url.split('/').map((String e) {
              String folderName = e;
              if (folderName.contains('_')) {
                folderName =
                    folderName.split('_').map(toBeginningOfSentenceCase).join();
              }
              if (!RegExp(r'^[A-Za-z0-9_]+$').hasMatch(folderName)) {
                return '';
              }
              return toBeginningOfSentenceCase(folderName);
            }).join();
        endpoints.add("static const String $propertyName = '$url';");
      }
    });

    return endpoints;
  }
}
