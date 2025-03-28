import 'package:flutter/material.dart';
import 'settings_screen.dart'; // Importa la pantalla de ajustes

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice para la página seleccionada

  // Lista de pantallas para cada sección
  final List<Widget> _pages = [
    const Center(child: Text('Pantalla de Reservas', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Pantalla de Inicio', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Pantalla de Perfil', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambia la pantalla cuando el usuario seleccione un botón
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        automaticallyImplyLeading: false, // Elimina el botón de retroceso
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Controla el índice seleccionado
        onTap: _onItemTapped, // Cambia la pantalla al tocar un botón
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
      ),
    );
  }
}
