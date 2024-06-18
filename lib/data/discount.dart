import 'package:dio/dio.dart';

Future<void> fetchDiscount(String coupon) async {
  final url = 'http://localhost:4000/api/v1/payment/discount?coupon=$coupon';
  try {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      final data = response.data;
      // Xử lý dữ liệu trả về từ API ở đây
      print('Discount data: $data');
    } else {
      print('Failed to fetch discount');
    }
  } catch (e) {
    print('Error: $e');
  }
}
