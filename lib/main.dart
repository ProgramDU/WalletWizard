import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'bienvenida_app.dart';
import 'dahsboard.dart';
import 'firebase_options.dart'; // Generado por FlutterFire CLI
import 'gastos_page.dart'; //
import 'home_screen.dart';
import 'introduccion.dart';
import 'login_screen.dart';
import 'main_app.dart';
import 'profile_page.dart';
import 'register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      // Usamos StreamBuilder para controlar sesión
      home: AuthenticationWrapper(),
      routes: {
        '/android': (context) => MainApp(), // Pantalla de bienvenida
        '/bienvenida': (context) => BienvenidaApp(), // Pantalla de bienvenida
        '/introduccion': (context) => IntroduccionApp(), // Pantalla de introducción
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterScreen(),
        '/gastos': (context) => GastosPage(),
        '/profile': (context )=> ProfilePage(), // Asegúrate de tener esta página
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}

// Widget para mostrar login o home según estado de sesión
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          } else {
            return Dashboard(); // Cambia a tu pantalla principal
          }
        }
        // Mostrar loading mientras espera estado
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

