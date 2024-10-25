import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionView extends StatefulWidget {
  @override
  _AgePredictionViewState createState() => _AgePredictionViewState();
}

class _AgePredictionViewState extends State<AgePredictionView> {
  int? _age;
  String _message = "";
  String _name = "";

  Future<void> _predictAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    final data = json.decode(response.body);

    setState(() {
      _age = data['age'];
      if (_age != null) {
        if (_age! < 18) {
          _message = "Es joven (Edad: $_age)";
        } else if (_age! < 60) {
          _message = "Es adulto (Edad: $_age)";
        } else {
          _message = "Es anciano (Edad: $_age)";
        }
      } else {
        _message = "No se pudo predecir la edad";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Predicción de Edad"),
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
              onPressed: () => _predictAge(_name),
              child: Text("Predecir Edad"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}