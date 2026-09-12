import 'receita.dart';

class LivroDeReceitas {
  final List<Receita> receitas = [];

  void adicionar(Receita receita){
    receitas.add(receita);
  }
}
