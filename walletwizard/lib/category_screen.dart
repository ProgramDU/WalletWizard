import 'package:walletwizard/add_expense_form.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<Map<String, dynamic>> categories = [
  {'name': 'Comida', 'icon': Icons.restaurant},
  {'name': 'Compras', 'icon': Icons.shopping_cart},
  {'name': 'Salud', 'icon': Icons.local_hospital},
  {'name': 'Transporte', 'icon': Icons.directions_car},
  {'name': 'Renta', 'icon': Icons.home},
  {'name': 'Entretenimiento', 'icon': Icons.movie},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF9),
      appBar: AppBar(
        title: const Text("Categorías"),
        backgroundColor: const Color(0xFF00C49A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
  itemCount: categories.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    childAspectRatio: 3,
  ),
  itemBuilder: (context, index) {
    final category = categories[index];
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 230, 244, 236),
        foregroundColor: const Color.fromARGB(255, 12, 12, 12),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => AddExpenseForm(category: category['name']),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category['icon'], size: 20),
          const SizedBox(width: 8),
          Text(category['name']),
        ],
      ),
    );
  },
),

      ),
    );
  }
}
