import 'dart:io';

import 'package:generate_swagger_endpoint/extensions/extension.dart'
    show FileExtension;

File readJSONFile(String path) {
  if (path.endsWith('.json')) {
    return File(path);
  }
  return Directory(path).listSync().toList().whereType<File>().firstWhere(
        (File entity) => entity.name != null && entity.name!.endsWith('.json'),
      );
}
