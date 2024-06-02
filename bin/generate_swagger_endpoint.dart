import 'dart:convert';
import 'dart:io';

import 'package:generate_swagger_endpoint/generate_swagger_endpoint.dart';

void main(List<String> args) async {
  final (String inputPath, String outputPath) = readArgument(args);
  final File inputFile = readJSONFile(inputPath);

  assert(inputFile.existsSync(), 'You should specify input swagger file');
  final Map<String, dynamic> swaggerJson =
      jsonDecode(inputFile.readAsStringSync());

  SwaggerReader swaggerReader = SwaggerReader(swaggerJson: swaggerJson);
  List<String> endpoints = swaggerReader.readEndpoints();
  final outputString =
      buildReadOnlyClass('Endpoints', content: endpoints.join('\n\t'));

  if (!Directory(outputPath).existsSync()) {
    Directory(outputPath).createSync();
  }
  print('hello');
  (outputPath.endsWith('.json')
          ? File(outputPath)
          : File('$outputPath/endpoints.dart'))
      .writeAsStringSync(outputString);
}