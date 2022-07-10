import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/view/pokemon.dart';
import 'package:http/http.dart' as http;

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPage();
}

class _PokedexPage extends State<PokedexPage> {
  List<Example> pokemonList = [];

  bool loading = true;

  @override
  void initState() {
    _getPokedex();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            //child: Image.network(''),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: pokemonList[index]),
                child: Container(
                  height: size.height * 0.1,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.03),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: size.height * 0.1,
                          child: Image.network(
                            pokemonList[index].thumbnailImage ?? '',
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          pokemonList[index].name ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        //color: Colors.amber,
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          textAlign: TextAlign.right,
                          pokemonList[index].number?.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _getPokedex() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    loading = true;

    await http.get(url).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          Map json = const JsonDecoder().convert(value.body);
          setState(() {
            pokemonList = json['data'].map<Example>((item) {
              return Example.fromJson(item);
            }).toList();
            loading = false;
          });
        });
      }
    });
  }
}
