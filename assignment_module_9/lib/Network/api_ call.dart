import 'package:assignment_module_9/Network/toast_utils.dart';
import 'package:assignment_module_9/weather_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sn_progress_dialog/progress_dialog.dart';

class WeatherApi{

  Future<ApiResponse?> getApiResponse(double lat ,double lon,var context)async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Searching Weather Data');
    try{
      final String urlData = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&APPID=0b6146f706beae9f16a063b902312f21";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      double temp = jsonData["main"]["temp"];
      int temparature = temp.toInt()-273;
      double mintemp = jsonData["main"]["temp_min"];
      int mintemparature = mintemp.toInt()-273;
      double maxtemp =jsonData["main"]["temp_max"];
      int maxtemparature = maxtemp.toInt()-273;
      ApiResponse data = ApiResponse(jsonData["weather"][0]["main"], jsonData['sys']['country'], jsonData["main"]["feels_like"],jsonData["name"],temparature,maxtemparature ,mintemparature, jsonData["weather"][0]["icon"]);
      pd.close();
      return data;
    }catch (e) {
      if (e is SocketException) {
        pd.close();
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        pd.close();
        ToastUtil.showShortToast("Request Time Out");
      } else {
        pd.close();
        ToastUtil.showLongToast("Network Error Please Login Again");
      }
    }
  }

}