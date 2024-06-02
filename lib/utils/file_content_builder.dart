String buildReadOnlyClass(String className, {String? content}) {
  return '''class $className {
  $className._();

  $content
}
''';
}
