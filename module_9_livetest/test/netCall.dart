

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'data_class.dart';
class NetworkCallData {

  Future<List<ApiDataResponse>?> getApiResponse()async{
    try{
      List<ApiDataResponse> res=[];
      final String urlData = "https://raw.githubusercontent.com/Mahibulhassan/Project_data-Json-data/main/cat.json";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      print(jsonData);

      var data = jsonData["recipes"];
      for(int i =0 ;i<data.length;i++){
        ApiDataResponse da = ApiDataResponse(data[i]["title"], data[i]["description"], data[i]["ingredients"]);
        res.add(da);
      }

      return res;
    }catch (e) {
      if (e is SocketException) {
      } else if (e is TimeoutException) {
      } else {
      }
    }
  }
}