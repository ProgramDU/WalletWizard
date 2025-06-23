import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Encabezado
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade400,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hola, Pablo', style: TextStyle(fontSize: 12)),
                        SizedBox(height: 8),
                        Text('\$99.30', style: titleStyle),
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(12),
                      ),
                      icon: Icon(Icons.add, size: 16),
                      label: Text(""),
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              SizedBox(height: 14),

              // Indicador de uso
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      percent: 0.5,
                      center: Text("50%"),
                      progressColor: Colors.blueAccent,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.attach_money, size: 18),
                              SizedBox(width: 8),
                              Text('\$99.99', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text('Saldo usado'),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.wallet, size: 18),
                              SizedBox(width: 8),
                              Text('\$80.00', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text('Saldo disponible'),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 14),

              // Icon Buttons Grid (ejemplo con íconos aleatorios)
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  _categoryIcon(Icons.fastfood, Colors.amber),
                  _categoryIcon(Icons.favorite, Colors.red),
                  _categoryIcon(Icons.wallet, Colors.brown),
                  _categoryIcon(Icons.checkroom, Colors.purple),
                  _categoryIcon(Icons.pets, Colors.black),
                  _categoryIcon(Icons.person, Colors.green),
                  _categoryIcon(Icons.tv, Colors.pink),
                  _categoryIcon(Icons.plus_one, Colors.grey),
                ],
              ),

              SizedBox(height: 22),

              // Tabs inferiores
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text('Diariamente', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text('Semanalmente', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryIcon(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: color.withAlpha((0.2 * 255).round()),
      radius: 24,
      child: Icon(icon, color: color),
    );
  }
  
  
}
