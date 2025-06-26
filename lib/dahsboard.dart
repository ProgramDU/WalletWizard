import 'package:flutter/material.dart';
import 'package:walletwizard/category_screen.dart';
import 'package:walletwizard/graph_screen.dart';
import 'package:walletwizard/history_screen.dart';
import 'package:walletwizard/notifications_screen.dart';

import 'home_screen.dart';
import 'profile_page.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(), // pantalla de inicio
    GraphScreen(), // Gráficas
    CategoryScreen(), // Categorías
    HistoryScreen(), // Historial
    NotificationsScreen(), // Notificaciones
    ProfilePage(), // Perfil
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF4FFF9),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Gráficas"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categorias"),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Historial"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notificaciones"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
  );
  }
}