(String inputPath, String outputPath) readArgument(List<String> arguments) {
  String inputPath = '';
  String outputPath = '';
  for (int i = 0; i < arguments.length; i++) {
    final String arg = arguments[i];
    if (arg == '--input' || arg == '-i') {
      assert(i < arguments.length - 1, 'Input path is required');
      i++;
      inputPath = arguments[i];
    }
    if (arg == '--output' || arg == '-o') {
      assert(i < arguments.length - 1, 'Output path is required');
      i++;
      outputPath = arguments[i];
    }
  }

  return (inputPath, outputPath);
}
