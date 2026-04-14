import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final baseUrl = 'https://69dde2f8410caa3d47ba20ba.mockapi.io';

  Future<void> send(String endpoint, Map<String, dynamic> data) async
  {
    try {
      final response = await dio.post("$baseUrl/$endpoint", data: data);
      print(response);
    } catch (e) {
      print(e);
    }
  }
  Future<void> get(String endpoint, Map<String, dynamic> data) async
  {
    try {
      final response = await dio.get("$baseUrl/$endpoint", data: data);
      print(response);
    } catch (e) {
      print(e);
    }
  }
  Future<void> put(String endpoint, Map<String, dynamic> data) async
  {
    try {
      final response = await dio.put("$baseUrl/$endpoint", data: data);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}