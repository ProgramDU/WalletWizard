import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'bienvenida_app.dart';
import 'dahsboard.dart';
import 'firebase_options.dart'; // Generado por FlutterFire CLI
import 'gastos_page.dart';
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

  final prefs = await SharedPreferences.getInstance();
  final bool bienvenidaVista = prefs.getBool('bienvenidaVista') ?? false;
  runApp(MyApp(bienvenidaVista: bienvenidaVista));
}

class MyApp extends StatelessWidget {
  final bool bienvenidaVista;
  const MyApp({super.key, required this.bienvenidaVista});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: bienvenidaVista ? AuthenticationWrapper() : BienvenidaApp(),
      routes: {
        '/android': (context) => MainApp(),
        '/bienvenida': (context) => BienvenidaApp(),
        '/introduccion': (context) => IntroduccionApp(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterScreen(),
        '/gastos': (context) => GastosPage(),
        '/profile': (context) => ProfilePage(),
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
            return Dashboard();
          }
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}