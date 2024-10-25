import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPredictionView extends StatefulWidget {
  @override
  _GenderPredictionViewState createState() => _GenderPredictionViewState();
}

class _GenderPredictionViewState extends State<GenderPredictionView> {
  String? _gender;
  String _name = "";
  String _message = "";

  Future<void> _predictGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    final data = json.decode(response.body);

    setState(() {
      _gender = data['gender'];
      if (_gender == "male") {
        _message = "El género es masculino";
      } else if (_gender == "female") {
        _message = "El género es femenino";
      } else {
        _message = "No se pudo predecir el género";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Predicción de Género"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Introduce tu nombre'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _predictGender(_name),
              child: Text("Predecir Género"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                color: _gender == "male" ? Colors.blue : (_gender == "female" ? Colors.pink : Colors.black),
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}