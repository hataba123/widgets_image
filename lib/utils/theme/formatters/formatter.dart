import 'package:intl/intl.dart';

class TFormatter{

  static String formatDate (DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // THIẾT KẾ KIỂU NGÀY CẦN NHẬN VÀO LÀ
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount); // Thiêt kế tiền tệ và biểu tượng
  }

  static String formatPhoneNumber (String phoneNumber){
    // Thiet ke số lượng số dt ở vn 10 số
    if (phoneNumber.length == 10){
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11){
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    // THÊM MỘT SỐ LOGIC SDT NẾU CẦN THIẾT KẾ THÊM
    return phoneNumber;
  }
}