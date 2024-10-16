import 'dart:convert';

import 'package:weather_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weathermodel.dart';


class WeatherApi{
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";
   Future<WeatherResponse> getCurrentWeather(String location) async{
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    //print("API URL: $apiUrl");
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(jsonDecode(response.body));
      } else {
        //print("Error: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to load weather");
      }
    } catch (e) {
     // print("Exception: $e");
      throw Exception("Failed to load weather: $e");
    }
  }
}