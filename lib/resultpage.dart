import 'package:flutter/material.dart';

class Arguments {
  final int result;
  Arguments(this.result);
}

class ResultPage extends StatelessWidget {
  static const routeName = 'results';
  const ResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Arguments;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Center(
            child: Text('Quiz  de flutter & dart'.toUpperCase()),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Resultado',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 130,
                child: Text(
                  'Você acertou ${arguments.result.toString()} de 5 perguntas',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                    minimumSize: const Size(200, 40),
                    backgroundColor: Colors.blue[900],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onPressed: () => Navigator.pushNamed(context, 'quiz'),
                child: Text(
                  'Jogar novamente'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
