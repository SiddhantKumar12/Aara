import 'package:aara_app/model/aara_model.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<AaraModel?> getAPI() async {
    var client = http.Client();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c3fb04334a7c647338cdfd500e2997bb9898cf52'
    };

    final url = Uri.parse(
        'http://api.reward-dragon.com:8000/customers/customer-josh-reason-today/?user_profile=500');
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }

    return aaraModelFromJson(response.body);
  }
}
