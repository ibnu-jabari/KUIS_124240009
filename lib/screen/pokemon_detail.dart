import 'package:flutter/material.dart';
import 'package:kuis_124240009/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemonList;

  const DetailPage({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 161, 63),
        foregroundColor: Colors.white,
        title: Text(pokemonList.name),
      ),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(pokemonList.image),
              Text(pokemonList.name),
              Text(pokemonList.types.join(", ")),
              Text("${pokemonList.ability} ${pokemonList.height} ${pokemonList.weight}"),
       
              // ElevatedButton(
              //   onPressed: (){
              //     Navigator.pop(context);
              //   }, 
              //   child: Text("Kembali")
              // )
            ],
          ),
        ),
      ),
    );
  }
}