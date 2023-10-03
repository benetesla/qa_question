import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!!';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 15) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text("Reiniciar"),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18, // Definindo o tamanho da fonte do botão.
            ),
          ),
        ),
      ],
    );
  }
}
