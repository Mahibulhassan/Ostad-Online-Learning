import 'package:assignment_module_9/Network/toast_utils.dart';
import 'package:assignment_module_9/weather_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class WeatherApi{

  Future<ApiResponse?> getApiResponse(double lat ,double lon)async{
    try{
      final String urlData = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&APPID=0b6146f706beae9f16a063b902312f21";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      ApiResponse data = ApiResponse(jsonData["weather"][0]["main"], jsonData['sys']['country'], jsonData["main"]["feels_like"],jsonData["name"],jsonData["main"]["temp"], jsonData["main"]["temp_max"], jsonData["main"]["temp_min"]);
      return data;
    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showLongToast("Network Error Please Login Again");
      }
    }
  }

}