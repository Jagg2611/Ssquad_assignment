import 'dart:convert';
import 'package:http/http.dart' as http;

class BanquetApiService {
  static Future<bool> submitBanquetRequest(Map<String, dynamic> data) async {
    const String apiUrl =
        "http://172.23.112.1:5000/api/banquets/request"; 
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Exception while submitting banquet request: $e");
      return false;
    }
  }
}
