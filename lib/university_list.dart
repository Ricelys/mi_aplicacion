import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversityListView extends StatefulWidget {
  @override
  _UniversityListViewState createState() => _UniversityListViewState();
}

class _UniversityListViewState extends State<UniversityListView> {
  List _universities = [];
  String _country = "";

  Future<void> _fetchUniversities(String country) async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$country'));
    final data = json.decode(response.body);

    setState(() {
      _universities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Universidades"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Introduce el nombre del país en inglés'),
              onChanged: (value) {
                setState(() {
                  _country = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _fetchUniversities(_country),
              child: Text("Buscar Universidades"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_universities[index]['name']),
                    subtitle: Text(_universities[index]['web_pages'][0]),
                    trailing: Icon(Icons.link),
                    onTap: () {
                      // Abre el sitio web de la universidad
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
