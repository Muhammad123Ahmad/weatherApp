import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/UI/get_weather/weather_model.dart';

class WeatherApiProvider extends ChangeNotifier {

  TextEditingController textController = TextEditingController();
  WeatherApiProvider() {
    getData();
  }
  WeatherApiModel Weather = WeatherApiModel();

  bool isLoading  = false;
  getData() async {

    if (textController.text.isEmpty)
    {
      return;

    }
    isLoading = true;
    notifyListeners();

    try{
      var response = await http.get(
      Uri.parse(
          'https://api.weatherstack.com/current?access_key=bba4df1ca4a25935c4449cdf7e6b353b&query=${textController.text.toString()}'),
    );

   // print(' this is data ${response.body}');

    if (response.statusCode == 200) {
      var maxdata = jsonDecode(response.body.toString());
      Weather = WeatherApiModel.fromJson(maxdata);

      notifyListeners();
    }
    else{
       throw Exception('Failed to load weather data');
    }
    
        }

    catch (e){
      debugPrint('Error fetching weather: $e');

    }
    finally{
      isLoading = false;
      notifyListeners();
    }

    
    
      
  }
}