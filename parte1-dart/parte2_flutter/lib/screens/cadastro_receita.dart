import 'package:flutter/material.dart';
import '../models/receita.dart';

class CadastroReceita extends StatefulWidget {
  const CadastroReceita({super.key});

  @override
  State<CadastroReceita> createState() => _CadastroReceitaState();
}

class _CadastroReceitaState extends State<CadastroReceita> {
  final _nomeController = TextEditingController();
  final _tempoController = TextEditingController();
  final _custoController = TextEditingController();

  @override
  void dispose() {
    // Todo TextEditingController precisa ser descartado quando o
    // widget sai de cena, senão vaza memória.
    _nomeController.dispose();
    _tempoController.dispose();
    _custoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    final nome = _nomeController.text.trim();

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dê um nome para a receita.')),
      );
      return;
    }

    // O controller sempre devolve String — por isso os campos
    // numéricos precisam de tryParse. Se a conversão falhar,
    // caímos num valor padrão em vez de travar o app.
    final tempo = int.tryParse(_tempoController.text) ?? 30;
    final custo =
        double.tryParse(_custoController.text.replaceAll(',', '.')) ?? 0.0;

    final novaReceita = Receita(
      nome: nome,
      tempoPreparoMinutos: tempo,
      custoAproximado: custo,
      dataCriacao: DateTime.now(),
      modoPreparo: 'Modo de preparo a definir.',
    );

    Navigator.of(context).pop(novaReceita);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova receita')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da receita',
                prefixIcon: const Icon(Icons.restaurant_menu),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _tempoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tempo de preparo (minutos)',
                prefixIcon: const Icon(Icons.schedule_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _custoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Custo aproximado (R\$)',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _confirmar,
              icon: const Icon(Icons.check),
              label: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}