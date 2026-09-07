import 'models/receita.dart';


void main(){
print('Projeto parte1-dart funcionando!');

final bolo = Receita( 
  nome: 'Bolo de Chocolate da vovó',
  tempoPreparoMinutos: 40,
  custoAproximado: 25.50,
  dataCriacao: DateTime.now(), modoPreparo: '',

);

  print('[1] RECEITA');
  print(' Nome: ${bolo.nome}');
  print('Tempo de preparo: ${bolo.tempoPreparoMinutos}minutos');
  print('Custo aproximado: R\$ ${bolo.custoAproximado}');
  print('Data de criação: ${bolo.dataCriacao}');

}
