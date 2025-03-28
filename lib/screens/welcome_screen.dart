import 'package:flutter/material.dart';
import 'package:app_padel/screens/register_screen.dart';
import 'package:app_padel/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center( // Centra el contenido principal
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "PlayDay",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Únete a nosotros y disfruta de jugar\nal pádel siempre que quieras",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                _buildButton("Registrarme", Colors.lightBlue.shade100, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                }),
                const SizedBox(height: 10),
                _buildButton("Iniciar sesión", Colors.lightBlue.shade100, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }),
              ],
            ),
          ),
          Positioned(
            left: 20, // Distancia desde el borde izquierdo
            bottom: 20, // Distancia desde el borde inferior
            child: const Text(
              "Al registrarte aceptas nuestra política de privacidad y nuestras condiciones",
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}