import 'package:flutter/material.dart';
import 'quiz_dados.dart';
import 'resultpage.dart';

class Quiz extends StatefulWidget {
  final List quiz;

  const Quiz({super.key, required this.quiz});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;

  @override
  Widget build(BuildContext context) {
    quiz.forEach((element) {
      int alternativaCorreta = element['alternativa_correta'];
      List respostas = element['respostas'];
      String respostaCorreta = element['respostas'][alternativaCorreta - 1];

      respostas.shuffle();

      int i = 1;

      respostas.forEach((element) {
        if (element == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      element['alternativa_correta'] = alternativaCorreta;
    });

    void respondeuQuiz(int respostaNumero) {
      setState(() {
        if (respostaNumero == quiz[perguntaNumero - 1]['alternativa_correta']) {
          acertos++;
        }
        if (perguntaNumero == 5) {
          Navigator.pushNamed(context, 'results',
              arguments: Arguments(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[500],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Quiz Curso Dart & flutter',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Pergunta $perguntaNumero de 5',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pergunta: ${quiz[perguntaNumero - 1]['pergunta']}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    minimumSize: const Size(200, 40),
                    backgroundColor: Colors.blue[500],
                    elevation: 5,
                  ),
                  onPressed: () => respondeuQuiz(1),
                  child: Text(
                    '${quiz[perguntaNumero - 1]['respostas'][0]}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    minimumSize: const Size(200, 40),
                    backgroundColor: Colors.blue[500],
                    elevation: 5,
                  ),
                  onPressed: () => respondeuQuiz(2),
                  child: Text(
                    '${quiz[perguntaNumero - 1]['respostas'][1]}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    minimumSize: const Size(200, 40),
                    backgroundColor: Colors.blue[500],
                    elevation: 5,
                  ),
                  onPressed: () => respondeuQuiz(3),
                  child: Text(
                    '${quiz[perguntaNumero - 1]['respostas'][2]}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    minimumSize: const Size(200, 40),
                    backgroundColor: Colors.blue[500],
                    elevation: 5,
                  ),
                  onPressed: () => respondeuQuiz(4),
                  child: Text(
                    '${quiz[perguntaNumero - 1]['respostas'][3]}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
