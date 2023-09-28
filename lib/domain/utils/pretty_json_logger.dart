
import 'dart:convert';
import 'dart:developer';

void logPrettyJsonString(String jsonString) {
  try {
    final jsonData = json.decode(jsonString);
    final encoder = JsonEncoder.withIndent('  '); 
    final prettyJson = encoder.convert(jsonData);
    log(prettyJson,level: 3);
  } catch (e) {
    log('Invalid JSON input: $e');
  }
}