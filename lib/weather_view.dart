import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  String _weather = "Cargando...";

  Future<void> _fetchWeather() async {
    // Usa tu nueva API key aquí
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Santo+Domingo&appid=2e2cbf72f1990855fb5137e7507b2c43&units=metric')); // Añadido "units=metric" para obtener la temperatura en °C
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _weather = "${data['weather'][0]['description']} - ${data['main']['temp']}°C";
      });
    } else {
      setState(() {
        _weather = "Error al cargar el clima"; // Mensaje de error
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima en Santo Domingo"),
      ),
      body: Center(
        child: Text(
          _weather,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
