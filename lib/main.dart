import 'package:flutter/material.dart';
import 'package:flutter_pokedex/view/pokedex_details.dart';
import 'package:flutter_pokedex/view/pokedex_page.dart';
import 'package:flutter_pokedex/view/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const PokedexPage(),
        '/details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Example;
          return Detalhes(item: args);
        } 
      },
    );
  }
}



  

