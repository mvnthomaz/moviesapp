import 'package:flutter/material.dart';
import 'package:movies_app/views/filmes_em_cartaz/filmes_em_cartaz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FilmesEmCartazPage(title: 'Movies App'),
    );
  }
}