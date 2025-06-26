import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF9),
      appBar: AppBar(
        title: const Text("Gráficas"),
        backgroundColor: const Color(0xFF00C49A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Distribución de gastos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      value: 500,
                      color: Colors.teal,
                      title: 'Comida',
                      radius: 60,
                    ),
                    PieChartSectionData(
                      value: 300,
                      color: Colors.blueAccent,
                      title: 'Transporte',
                      radius: 60,
                    ),
                    PieChartSectionData(
                      value: 200,
                      color: Colors.orange,
                      title: 'Entretenimiento',
                      radius: 60,
                    ),
                    PieChartSectionData(
                      value: 100,
                      color: Colors.red,
                      title: 'Salud',
                      radius: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
