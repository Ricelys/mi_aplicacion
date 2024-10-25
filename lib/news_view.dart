import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List _articles = [];
  bool _loading = true;

  void fetchNews() async {
    try {
      // Cambia la URL a la del sitio de WordPress que deseas consultar
      final response = await http.get(Uri.parse('https://kinsta.com/blog/wp-json/wp/v2/posts?_fields=title,excerpt,link&_embed&per_page=3'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _articles = data;
          _loading = false;
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Últimas Noticias"),
      ),
      body: _loading 
          ? Center(child: CircularProgressIndicator())
          : _articles.isEmpty 
              ? Center(child: Text("No hay noticias disponibles."))
              : Column(
                  children: [
                    // Logo de la página (cambia la URL a la del logo real)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.network('https://kinsta.com/blog/wp-content/uploads/2021/05/wordpress-logo.png', height: 100),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _articles.length,
                        itemBuilder: (context, index) {
                          final article = _articles[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: ListTile(
                              title: Text(article['title']['rendered']),
                              subtitle: Text(article['excerpt']['rendered'].replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '')), // Remove HTML tags
                              onTap: () => launchURL(article['link']),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'No se pudo abrir $url';
    }
  }
}
