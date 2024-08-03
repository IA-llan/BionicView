import 'package:flutter/material.dart';

class ArquivosScreen extends StatefulWidget {
  const ArquivosScreen({super.key});

  @override
  _ArquivosScreenState createState() => _ArquivosScreenState();
}

class _ArquivosScreenState extends State<ArquivosScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pop(context); // Navegar de volta para a HomeScreen
      } else if (index == 1) {
        // Navegar para a tela de Dispositivos
      } else if (index == 2) {
        // Navegar para a tela de Perfil
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48B281), // Cor de fundo
      appBar: AppBar(
        backgroundColor: const Color(0xFF48B281),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Arquivos gerados',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Exemplo: 10 arquivos
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text('Arquivo1.pdf'),
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (String result) {
                  switch (result) {
                    case 'Editar':
                      // Lógica para editar o arquivo
                      break;
                    case 'Renomear':
                      // Lógica para renomear o arquivo
                      break;
                    case 'Excluir':
                      // Lógica para excluir o arquivo
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Editar',
                    child: Text('Editar'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Renomear',
                    child: Text('Renomear'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Excluir',
                    child: Text('Excluir'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            const Color(0xFF48B281), // Cor dos ícones e texto selecionados
        unselectedItemColor:
            Colors.white, // Cor dos ícones e texto não selecionados
        backgroundColor:
            const Color(0xFF1D1F24), // Cor de fundo da barra de navegação
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
}
