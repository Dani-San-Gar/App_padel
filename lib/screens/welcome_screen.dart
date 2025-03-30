import 'package:flutter/material.dart';
import 'package:app_padel/screens/register_screen.dart';
import 'package:app_padel/screens/login_screen.dart';
import 'package:animate_do/animate_do.dart'; // Importamos el paquete de animaciones

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animación para el título
            FadeInDown(
              child: const Text(
                "PlayDay",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Animación para el texto descriptivo
            FadeInDown(
              delay: const Duration(milliseconds: 300),
              child: const Text(
                "Únete a nosotros y disfruta de jugar\nal pádel siempre que quieras",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),

            // Animación y nuevo diseño para los botones
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: _buildGradientButton("Registrarme", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              }),
            ),
            const SizedBox(height: 10),

            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: _buildGradientButton("Iniciar sesión", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Animación para el texto de privacidad
            FadeInUp(
              delay: const Duration(milliseconds: 1000),
              child: const Text(
                "Al registrarte aceptas nuestra política de privacidad y nuestras condiciones",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientButton(String text, VoidCallback onPressed) {
    return Container(
      width: 250,
      height: 45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Para que ocupe todo el contenedor
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
