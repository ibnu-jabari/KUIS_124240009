import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  Widget _attribute(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          const Icon(Icons.chevron_right, size: 18),
          const SizedBox(width: 4),
          Text('$label: $value'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 161, 63),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Detail: ${pokemon.name}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Center(
              child: CircleAvatar(
                radius: 90,
                backgroundColor: const Color(0xFFE8DEF8),
                child: Image.network(
                  pokemon.image,
                  width: 150,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.catching_pokemon, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Nama
            Center(
              child: Text(
                pokemon.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            // Types
            Center(
              child: Wrap(
                spacing: 8,
                children: pokemon.types
                    .map((type) => Chip(label: Text(type)))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Atribut lain: id, ability, height, weight
            const Text(
              'Attributes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            _attribute('ID', '${pokemon.id}'),
            _attribute('Ability', pokemon.ability),
            _attribute('Height', '${pokemon.height}'),
            _attribute('Weight', '${pokemon.weight}'),
          ],
        ),
      ),
      // Tombol Kembali ke Home
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ),
        ),
      ),
    );
  }
}