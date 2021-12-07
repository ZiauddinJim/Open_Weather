import 'package:flutter/material.dart';
import 'package:openweather/weather_provider/weather_provider.dart';
import 'package:provider/provider.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool isloading = true;

  @override
  void didChangeDependencies() {
    Provider.of<WeatherProvider>(context)
        .getcurrentWeatherInfo()
        .then((weatherData) {
      setState(() {
        isloading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text("${value.getMainWeatherResponse.main.temp}c"),
                  ),
                ),
              ],
            ),
    );
  }
}
