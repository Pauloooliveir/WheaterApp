// lib/weather_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  Future<List<Weather>> fetchWeather() async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=-23.55&longitude=-46.63&daily=temperature_2m_max,temperature_2m_min&timezone=America/Sao_Paulo',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> dailyData = data['daily']['temperature_2m_max'];
      List<Weather> weatherList = [];

      for (int i = 0; i < dailyData.length; i++) {
        weatherList.add(Weather(
          date: data['daily']['time'][i],
          temperature: dailyData[i].toDouble(),
          description: 'Temp max',
          icon:
              'https://icon-library.com/images/weather-icon/weather-icon-4.jpg', // Placeholder icon
        ));
      }
      return weatherList;
    } else {
      throw Exception('Erro ao carregar dados');
    }
  }
}
