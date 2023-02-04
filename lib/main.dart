import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int count = 0;

  void decrement() {
    setState(() {
      //serve para atualizar as mudancas na tela
      count--;
      if (count < 0) {
        count = 0;
      }
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        // ignore: prefer_const_literals_to_create_immutables
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/imagem.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Column centraliza na
            //vertical.
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                isFull ? 'Lotado' : 'Pode Entrar!',
                style: TextStyle(
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      color: isFull ? Colors.red : Colors.white, fontSize: 100),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Row centraliza na
                //horizontal.
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23))),
                    onPressed: isEmpty ? null : decrement,
                    child: const Text('Saiu',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                23))), //cor quando pressionado
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      'Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
