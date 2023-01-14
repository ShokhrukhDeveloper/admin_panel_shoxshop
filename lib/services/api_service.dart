import 'dart:convert';

import 'package:dashboard_shox_shop/data/models/all_category.dart';
import 'package:http/http.dart' as http;

import '../data/urls.dart';

class ApiService {
  static Future<dynamic> Get({required String Url}) async {
    var result = await http.get(Uri.parse(Url));
    print(result.statusCode);
    print(result.body);
    if (result.statusCode == 200) {
      return AllCagegory.fromJson(json.decode(result.body));
    }
  }
}
