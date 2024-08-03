// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'arquivos_screen.dart';
import 'perfil_screen.dart'; // Importar a nova tela

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _pageIndex = 0;
  double tamanhoIcon = 250.0;
  double tamanhoFonte = 40;
  double heightSize = 10;
  Color background = const Color(0xFF48B281);
  Color branco = Colors.white;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PerfilScreen(),
        ),
      ).then((_) {
        setState(() {
          _selectedIndex = 0; // Volta para a Home
        });
      });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'BIONIC VIEW',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
      body: _buildHomeContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: background,
        unselectedItemColor: branco,
        backgroundColor: const Color(0xFF1D1F24),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArquivosScreen()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.insert_drive_file_outlined,
                          size: tamanhoIcon, color: Colors.black),
                      SizedBox(height: heightSize),
                      Text('Arquivos', style: TextStyle(fontSize: tamanhoFonte))
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined,
                        size: tamanhoIcon, color: Colors.black),
                    SizedBox(height: heightSize),
                    Text('Dispositivo',
                        style: TextStyle(fontSize: tamanhoFonte))
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _pageIndex == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        const SizedBox(height: 16), // Espaço abaixo dos indicadores
      ],
    );
  }
}
