import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Hace que la imagen ocupe toda la pantalla
        children: [
          Image.asset(
            'assets/images/fondo app.png', // Ruta de la imagen en tu proyecto
            fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "PlayDay",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Únete a nosotros y disfruta de jugar\nal pádel siempre que quieras",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 30),
                // ignore: deprecated_member_use
                _buildButton("Registrarme", Colors.white.withOpacity(0.8), () {
                  print("Registrarme presionado");
                }),
                const SizedBox(height: 10),
                // ignore: deprecated_member_use
                _buildButton("Iniciar sesión", Colors.white.withOpacity(0.8), () {
                  print("Iniciar sesión presionado");
                }),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: const Text(
              "Al registrarte estás aceptando nuestra política de privacidad y nuestras condiciones",
              style: TextStyle(fontSize: 10, color: Colors.black),
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