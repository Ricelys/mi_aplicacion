import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de mí"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('your_photo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              "Nombre: Ricelys Marte",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Correo: 20221943@itla.edu.do",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Teléfono: +1 (809) 434-2078",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
