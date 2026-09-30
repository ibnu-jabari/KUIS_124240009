import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import 'pokemon_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];

        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(pokemon: pokemon),
                ),
              );
            },
            leading: Image.network(
              pokemon.image,
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.catching_pokemon, size: 40),
            ),
            title: Text(
              pokemon.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Wrap(
              spacing: 6,
              children: pokemon.types
                  .map(
                    (type) => Chip(
                      label: Text(type, style: const TextStyle(fontSize: 12)),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                  .toList(),
            ),
            trailing: const Icon(Icons.info_outline),
          ),
        );
      },
    );
  }
}