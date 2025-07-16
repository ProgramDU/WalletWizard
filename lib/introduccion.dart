import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart'; // Para acceder a AuthenticationWrapper

class IntroduccionApp extends StatelessWidget {
  const IntroduccionApp({super.key});

  Future<void> _continuar(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bienvenidaVista', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthenticationWrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  'Controla tus gastos, protege tu dinero y alcanza tus objetivos financieros',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Aquí puedes poner una imagen o lo que gustes
                    ElevatedButton(
                      onPressed: () => _continuar(context),
                      child: const Text('¡Comenzar!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
