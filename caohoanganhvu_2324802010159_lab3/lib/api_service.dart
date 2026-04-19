import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final baseUrl = 'https://69dde2f8410caa3d47ba20ba.mockapi.io';

  Future<void> send(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post("$baseUrl/$endpoint", data: data);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> get(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.get("$baseUrl/$endpoint", data: data);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final email = data['email'];
      final response = await dio.get("$baseUrl/$endpoint?email=$email");
      print(response.data);
      final data2 = response.data[0];
      print(data2['id']);
      final String id = data2['id'].toString();
      final respone2 = await dio.put("$baseUrl/$endpoint/$id", data: data);
      print(respone2.data);
    } catch (e) {
      print(e);
    }
  }
}
