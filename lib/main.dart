import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int count = 0;

  void decrement() {
    //informando a mudança de estado
    setState(() {
      count --;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count ++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container( //colocado dentro de um container para colocar imagem de fundo
          decoration: const BoxDecoration( //para colocar imagem
            image: DecorationImage( //chamando funcao para colocar imagem
              image: AssetImage('assets/images/fundo.jpg'),
              fit: BoxFit.cover, // esticando imagem para caber na tela
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //posicionamento do meu widget
            children: [
              Text(
                isFull? 'Lotado' : 'Pode Entrar!',
                style: TextStyle(
                  fontSize: 30,
                  color: isFull? Colors.red : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding( //Colocando o widget para dentro de um padding para acetar o espaçamento
                padding: const EdgeInsets.all(40),
                child: Text(
                  count.toString(),
                  style:  TextStyle(
                    fontSize: 100,
                    color: isFull? Colors.red : Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty? null : decrement, //chamando funcao no toque
                    style: TextButton.styleFrom(//Estilizando botao
                        backgroundColor: isEmpty? Color.fromARGB(217,196,236,255).withOpacity(0.2) : Color.fromARGB(217,196,236,255), //Fundo do botao
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,//tamanho do botao
                        shape: RoundedRectangleBorder( //Objeto para borda
                          borderRadius: BorderRadius.circular(
                              24), //Arredondando borda e passando parametro
                        )
                    ),
                    child: const Text('SAIU',
                        style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: isFull? null : increment,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull? Color.fromARGB(217,196,236,255).withOpacity(0.2) : Color.fromARGB(217,196,236,255),
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: const Text('ENTROU',
                        style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}

