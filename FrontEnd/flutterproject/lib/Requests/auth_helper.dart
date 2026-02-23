import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

Future<Map<String, String>> authHeaders() async {
  final String? token = await _secureStorage.read(key: 'token');
  if (token == null || token.isEmpty) return {};
  return {'Authorization': 'Bearer $token'};
}