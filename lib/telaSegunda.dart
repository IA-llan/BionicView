import 'package:flutter/material.dart';
import 'RegisterScreen.dart';
import 'LoginScreen.dart'; // Importe a tela de login

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48B281), // Cor de fundo
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset('assets/logo.png',
                      height: 100), // Substitua pelo seu logo
                  const SizedBox(height: 20),
                  const Text(
                    'Junte-se a nós e transforme\nsua rotina com nosso app\ninovador.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Crie sua conta hoje mesmo e\ndesfrute de uma\nacessibilidade mais\npersonalizada e autonomia\npara você.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen()), // Navega para a tela de login
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFF1D1F24), // Cor de fundo do botão
                            minimumSize: const Size(double.infinity,
                                48), // Botão preenchendo a largura
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterScreen()), // Navega para a tela de registro
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.grey[300], // Cor de fundo do botão
                            minimumSize: const Size(double.infinity,
                                48), // Botão preenchendo a largura
                          ),
                          child: const Text(
                            'Registrar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
