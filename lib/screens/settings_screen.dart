import 'package:flutter/material.dart';
import 'package:app_padel/screens/welcome_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: Colors.lightBlue.shade100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Aquí irán las configuraciones',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Redirige a la pantalla de bienvenida al cerrar sesión
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false, // Elimina todas las rutas previas
                  );
                },
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
