import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, dynamic>> gastos = const [
    {
      'nombre': 'Hamburguesas',
      'monto': 120.0,
      'fecha': '24/06/2025',
      'categoria': 'Comida',
      'icono': Icons.restaurant,
    },
    {
      'nombre': 'Taxi',
      'monto': 85.5,
      'fecha': '23/06/2025',
      'categoria': 'Transporte',
      'icono': Icons.directions_car,
    },
    {
      'nombre': 'Netflix',
      'monto': 200.0,
      'fecha': '22/06/2025',
      'categoria': 'Entretenimiento',
      'icono': Icons.movie,
    },
    {
      'nombre': 'Medicinas',
      'monto': 150.0,
      'fecha': '21/06/2025',
      'categoria': 'Salud',
      'icono': Icons.local_hospital,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF9),
      appBar: AppBar(
        title: const Text("Historial"),
        backgroundColor: const Color(0xFF00C49A),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: gastos.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final gasto = gastos[index];
          return ListTile(
            leading: Icon(gasto['icono'], color: Colors.teal),
            title: Text(gasto['nombre']),
            subtitle: Text('${gasto['categoria']} • ${gasto['fecha']}'),
            trailing: Text(
              '-\$${gasto['monto'].toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
