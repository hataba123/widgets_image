import 'package:dio/dio.dart';

class ApiService {
  static const String apiUrl = 'http://10.0.2.2:4000/api/v1/user/login';

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        apiUrl,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
