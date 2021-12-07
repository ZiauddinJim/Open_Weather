import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:openweather/model/weather_response.dart';
import 'package:provider/provider.dart';

class WeatherProvider with ChangeNotifier {
  late WeatherResponse _mainWeatherResponse;

  WeatherResponse get getMainWeatherResponse => _mainWeatherResponse;

  Future<void> getcurrentWeatherInfo() async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=London&appid=04e9233e2ffab82402a2e03b0921940f";
    final respone = await http.get(Uri.parse(url));
    final myMap = jsonDecode(respone.body);

    _mainWeatherResponse = WeatherResponse.fromMap(myMap);
    notifyListeners();
  }
}
