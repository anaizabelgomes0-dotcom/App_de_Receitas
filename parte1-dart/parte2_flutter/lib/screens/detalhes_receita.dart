import 'package:flutter/material.dart';
import '../models/receita.dart';

class DetalhesReceita extends StatelessWidget {
  final Receita receita;

  const DetalhesReceita({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da receita'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receita.nome,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Tempo de preparo',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${receita.tempoPreparoMinutos} minutos'),

            const SizedBox(height: 20),

            Text(
              'Custo aproximado',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'R\$ ${receita.custoAproximado.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 20),

            const Text(
              'Modo de preparo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              receita.modoPreparo,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}