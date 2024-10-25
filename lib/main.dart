import 'package:flutter/material.dart';
import 'gender_view.dart'; // Asegúrate de que GenderPredictionView esté definido aquí
import 'age_view.dart';    // Asegúrate de que AgePredictionView esté definido aquí
import 'university_list.dart'; // Asegúrate de que UniversityListView esté definido aquí
import 'weather_view.dart'; // Asegúrate de que WeatherView esté definido aquí
import 'news_view.dart'; // Asegúrate de que NewsView esté definido aquí
import 'about_view.dart'; // Asegúrate de que AboutView esté definido aquí

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi app',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // Eliminar el textTheme si da error
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvendo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Género'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenderPredictionView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Edad'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgePredictionView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Universidades'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UniversityListView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Clima'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Noticias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca de mí'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutView()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selecciona una opción del menú',
          style: TextStyle(fontSize: 20, color: Colors.black87), // Define el estilo de texto aquí
        ),
      ),
    );
  }
}
