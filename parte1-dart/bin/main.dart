import 'models/receita.dart';
import 'models/receitas2.dart';
import 'models/livro_de_receitas.dart';

void main(){
  print('Projeto parte1-dart funcionando!');

  final bolo = Receita(
    nome: 'Bolo de Chocolate da vovó',
    tempoPreparoMinutos: 40,
    custoAproximado: 25.50,
    dataCriacao: DateTime.now(),
    modoPreparo: '',
  );


  final livro = LivroDeReceitas();
  livro.adicionar(bolo);

  print('[1] RECEITA');
  print(' Nome: ${bolo.nome}');
  print('Tempo de preparo: ${bolo.tempoPreparoMinutos}minutos');
  print('Custo aproximado: R\$ ${bolo.custoAproximado}');
  print('Data de criação: ${bolo.dataCriacao}');

  final receitaComum = Receita(
    nome: 'Bolo de Chocolate',
    tempoPreparoMinutos: 50,
    custoAproximado: 22.0,
    dataCriacao: DateTime.now(),
    modoPreparo: 'Misture os ingredientes e asse por 40 minutos.',
  );

  final receitaSecreta = ReceitaSecreta(
    nome: 'Bolo de Chocolate',
    tempoPreparoMinutos: 50,
    custoAproximado: 22.0,
    dataCriacao: DateTime.now(),
    modoPreparo: 'Misture os ingredientes e asse por 40 minutos.',
    contatoConfianca: '180',
    palavraChave: 'preciso de ajuda',
  );

  print('');
  print('===== [2] HERANÇA =====');
  print('Receita comum -> ficha: "${receitaComum.ficha()}"');
  print('ReceitaSecreta -> ficha: "${receitaSecreta.ficha()}"');

 print('');
 print('===== [3] LIVRO DE RECEITAS =====');
 print('Total de receitas: ${livro.receitas.length}');

for (final receita in livro.receitas) {
  print('- ${receita.nome}');
}

  print('');
  print('===== [4] ENCAPSULAMENTO =====');
  print('Tempo total de preparo (antes): ${livro.tempoTotalPreparoMinutos} min');

  final receitaExtra = Receita(
    nome: 'Torta de Limão',
    tempoPreparoMinutos: 35,
    custoAproximado: 18.0,
    dataCriacao: DateTime.now(),
    modoPreparo: 'Monte a torta e leve à geladeira por 2 horas.',
  );
  livro.adicionar(receitaExtra);

  print('Tempo total de preparo (depois de adicionar "${receitaExtra.nome}"): '
      '${livro.tempoTotalPreparoMinutos} min');

}