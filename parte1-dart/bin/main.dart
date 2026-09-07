import 'models/receita.dart';
import 'models/receitas2.dart';
void main(){
  print('Projeto parte1-dart funcionando!');

  final bolo = Receita(
    nome: 'Bolo de Chocolate da vovó',
    tempoPreparoMinutos: 40,
    custoAproximado: 25.50,
    dataCriacao: DateTime.now(),
    modoPreparo: '',
  );

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
}