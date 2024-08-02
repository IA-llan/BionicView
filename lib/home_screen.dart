import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
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
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background, // Cor de fundo da tela
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        title: const Center(
          child: Text(
            'BIONIC VIEW',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.insert_drive_file_outlined, size: tamanhoIcon, color: Colors.black),
                      SizedBox(height: heightSize),
                      Text('Arquivos', style: TextStyle(fontSize: tamanhoFonte))
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, size: tamanhoIcon, color: Colors.black),
                      SizedBox(height: heightSize),
                      Text('Dispositivo', style: TextStyle(fontSize: tamanhoFonte))
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outlined, size: tamanhoIcon, color: Colors.black),
                      SizedBox(height: heightSize),
                      Text('Perfil', style: TextStyle(fontSize: tamanhoFonte))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
          const SizedBox(height: 16), // Espaço abaixo dos indicadores
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: branco, // Cor dos ícones e texto selecionados
        unselectedItemColor: background, // Cor dos ícones e texto não selecionados
        backgroundColor: const Color(0xFF1D1F24), // Cor de fundo da barra de navegação
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Arquivos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Dispositivo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil', 
          ),
        ],
      ),
    );
  }
}
