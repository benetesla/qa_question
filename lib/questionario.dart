import 'package:flutter/material.dart';
import 'package:qa_question/resposta.dart';

import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    Key? key,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostasObjetos = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>)
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostasObjetos
            .map(
              (resposta) => Resposta(
                resposta['texto'] as String,
                () => quandoResponder(resposta['pontuacao'] as int),
              ),
            )
            .toList(),
      ],
    );
  }
}
