import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 32),
          Center(
            child: Icon(
              Icons.science,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'HydroBuddy',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '1.0.0+1',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Calculadora de soluções nutritivas hidropônicas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Créditos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'HydroBuddy é uma reimplementação em Dart/Flutter do HydroBuddy '
            'original, desenvolvido por Daniel Fernandez em Pascal/Lazarus.\n\n'
            'O HydroBuddy original é uma ferramenta de código aberto para '
            'cálculo de soluções nutritivas hidropônicas, amplamente utilizada '
            'por pesquisadores e produtores ao redor do mundo.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          const Text(
            'Licença',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Este projeto é distribuído sob a licença GPL v3.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
