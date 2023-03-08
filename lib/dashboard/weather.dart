import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: WeatherPage(),
    ));

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = "";
  String _weatherC = "";

  Future<void> _getWeather() async {
    // Make a GET request to the OpenWeatherMap API
    var response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=e5f0de7f89494da8b3a90715232401&q=$_cityName&aqi=yes'));

    // Convert the response to a JSON object
    var jsonData = json.decode(response.body);

    // Extract the temperature from the JSON object
    var temperature = jsonData['current']['temp_c'];

    // Update the weather variable with the temperature
    setState(() {
      _weatherC = "$temperature C";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                _cityName = value;
              },
              decoration: InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: _getWeather,
              child: Text(
                'Get Weather',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(_weatherC),
          )
        ],
      ),
    );
  }
}
