import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hackathon_v2_deuna/ui/shared/app_bar_title.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

class GraficoAcciones extends StatefulWidget {
  final String nombreEmpresa;
  final List<FlSpot> historialAcciones;

  const GraficoAcciones({
    required this.nombreEmpresa,
    required this.historialAcciones,
  });

  @override
  _GraficoAccionesState createState() => _GraficoAccionesState();
}

class _GraficoAccionesState extends State<GraficoAcciones> {
  int acciones = 10; // Valor inicial arbitrario de acciones

  void comprarAccion() {
    setState(() {
      acciones++;
    });
  }

  void venderAccion() {
    if (acciones > 0) {
      setState(() {
        acciones--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(text: widget.nombreEmpresa),
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.3,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: widget.historialAcciones.length.toDouble() - 1,
                  minY: 0,
                  maxY: widget.historialAcciones
                          .map((e) => e.y)
                          .reduce((a, b) => a > b ? a : b) +
                      10,
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.historialAcciones,
                      isCurved: true,
                      color: Colors.green,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withAlpha((255 * 0.5).toInt()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Tú número de acciones: $acciones, Total: \$${(acciones * widget.historialAcciones.last.y).toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: comprarAccion,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Comprar", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: venderAccion,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Vender", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
