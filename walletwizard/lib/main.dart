import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Importación de las pantallas
import 'main_app.dart';
import 'bienvenida_app.dart';
import 'introduccion.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WalletWizard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Ruta inicial
      home: MainApp(),

      // Opcional: definición de rutas si deseas usarlas más adelante
      routes: {
        '/bienvenida': (context) => BienvenidaApp(),
        '/introduccion': (context) => IntroduccionApp(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
