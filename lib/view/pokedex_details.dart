import 'package:flutter/material.dart';
import 'package:flutter_pokedex/view/pokemon.dart';

class Detalhes extends StatelessWidget {
  final Example item;
  const Detalhes({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(item.name ?? '')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Text('#${item.number ?? ''}'),
                        Center(
                          child: Image.network(item.thumbnailImage ?? ''),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      
                      item.description ?? ''),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                    const Text(
                      
                      'Tipo:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(item.type!.join(' - ')),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                    const Text(
                      
                      'Fraquezas:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(item.weakness!.join(' - ')),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
