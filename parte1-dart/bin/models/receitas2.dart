import 'receita.dart';

class ReceitaSecreta extends Receita {
  final String contatoConfianca;
  final String palavraChave;

  ReceitaSecreta({
    required super.nome,
    required super.tempoPreparoMinutos,
    required super.custoAproximado,
    required super.dataCriacao,
    required super.modoPreparo,
    required this.contatoConfianca,
    required this.palavraChave,
  });

  @override
  String ficha() {
    final base = super.ficha();
    return '$base | Segredo da receita: "$palavraChave" '
        '(contato: $contatoConfianca)';
  }
}