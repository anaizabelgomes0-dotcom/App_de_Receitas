import 'receita.dart';

class LivroDeReceitas {
  final List<Receita> _receitas = [];

  
  List<Receita> get receitas => List.unmodifiable(_receitas);

  void adicionar(Receita receita) {
    _receitas.add(receita);
  }


  int get tempoTotalPreparoMinutos {
    var total = 0;
    for (final receita in _receitas) {
      total += receita.tempoPreparoMinutos;
    }
    return total;
  }
}