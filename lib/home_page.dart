import 'package:flutter/material.dart';
import 'package:openweather/CurrentWeather.dart';
import 'package:openweather/ForcastWeather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
          bottom: TabBar(
            tabs: [
              Text("Current Weather"),
              Text("Forcast Weather"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CurrentWeather(),
            ForcastWeather(),
          ],
        ),
      ),
    );
  }
}
