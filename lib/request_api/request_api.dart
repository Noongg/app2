import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:test_flutter_app2/model/vegetables.dart';

const URL_API="https://6103552d79ed68001748249c.mockapi.io/api/user/vegetables";
class RequestApi{
  static Future<List<Vegetables>> getVegetables() async {
    final response = await http.get(Uri.parse(URL_API));
    if (response.statusCode == 200) {
      var list=convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;
      List<Vegetables> vegetables=list.map((e) => Vegetables.fromJson(e)).toList();
      return vegetables;
    } else {
      throw Exception('Failed to load api');
    }
  }
}