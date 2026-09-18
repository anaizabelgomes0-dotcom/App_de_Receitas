import 'package:flutter/material.dart';
import 'models/receita.dart';
import 'models/livro_de_receitas.dart';
import 'widgets/receita_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sabor de Casa',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF7F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD9534F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF7F2),
          foregroundColor: Color(0xFF1F2421),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  LivroDeReceitas criarLivro() {
    final livro = LivroDeReceitas();

    final receitas = [
      Receita(
        nome: 'Bolo de cenoura',
        tempoPreparoMinutos: 45,
        custoAproximado: 25.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Misture os ingredientes e asse.',
      ),
      Receita(
        nome: 'Arroz de forno',
        tempoPreparoMinutos: 30,
        custoAproximado: 20.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Misture os ingredientes e leve ao forno.',
      ),
      Receita(
        nome: 'Lasanha caseira',
        tempoPreparoMinutos: 60,
        custoAproximado: 45.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Monte as camadas e asse.',
      ),
      Receita(
        nome: 'Panqueca',
        tempoPreparoMinutos: 25,
        custoAproximado: 18.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Prepare a massa e recheie.',
      ),
      Receita(
        nome: 'Pão de queijo',
        tempoPreparoMinutos: 35,
        custoAproximado: 22.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Misture os ingredientes e asse.',
      ),
      Receita(
        nome: 'Torta de frango',
        tempoPreparoMinutos: 50,
        custoAproximado: 35.0,
        dataCriacao: DateTime.now(),
        modoPreparo: 'Prepare a massa, recheie e asse.',
      ),
    ];

    for (final receita in receitas) {
      livro.adicionar(receita);
    }

    return livro;
  }

  @override
  Widget build(BuildContext context) {
    final livro = criarLivro();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sabor de Casa',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Minhas receitas',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2421),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Receitas que têm gosto de lembrança.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Lista de receitas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D6A4F),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: livro.receitas.length,
                itemBuilder: (context, index) {
                  final receita = livro.receitas[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: ReceitaCard(receita: receita),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}