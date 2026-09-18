import 'package:flutter/material.dart';
import 'models/receita.dart';
import 'models/livro_de_receitas.dart';
import 'widgets/receita_card.dart';
import 'screens/cadastro_receita.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LivroDeReceitas _livro;

  @override
  void initState() {
    super.initState();
    _livro = _criarLivro();
  }

  LivroDeReceitas _criarLivro() {
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

  Future<void> _abrirCadastro() async {
    final novaReceita = await Navigator.of(context).push<Receita>(
      MaterialPageRoute(
        builder: (context) => const CadastroReceita(),
      ),
    );

    if (novaReceita != null) {
      setState(() {
        // Chama o método do exercício 3/4 (LivroDeReceitas.adicionar)
        // dentro do setState — é isso que avisa o Flutter para
        // reconstruir a tela com a lista e o total atualizados.
        _livro.adicionar(novaReceita);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Nova receita'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lista de receitas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D6A4F),
                  ),
                ),
                Text(
                  'Total: ${_livro.tempoTotalPreparoMinutos} min',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFD9534F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _livro.receitas.length,
                itemBuilder: (context, index) {
                  final receita = _livro.receitas[index];

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