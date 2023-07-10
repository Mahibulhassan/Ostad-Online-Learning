import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'data_class.dart';
class NetworkCallData {

  Future<ResponseDataClass?> getApiResponse()async{
    try{
      final String urlData = "https://raw.githubusercontent.com/Mahibulhassan/Project_data-Json-data/main/cat.json";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var data = ResponseDataClass.fromJson(jsonData);
      return data;
    }catch (e) {
      if (e is SocketException) {
      } else if (e is TimeoutException) {
      } else {
      }
    }
  }
}