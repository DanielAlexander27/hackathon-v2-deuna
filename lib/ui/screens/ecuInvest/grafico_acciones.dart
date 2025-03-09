import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hackathon_v2_deuna/ui/shared/app_bar_title.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

// Nueva pantalla para mostrar el gráfico de fluctuación
class GraficoAcciones extends StatelessWidget {
  final String nombreEmpresa;
  final List<FlSpot> historialAcciones;

  const GraficoAcciones({
    required this.nombreEmpresa,
    required this.historialAcciones,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(text: nombreEmpresa),
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            minX: 0,
            maxX: historialAcciones.length.toDouble() - 1,
            minY: 0,
            maxY:
                historialAcciones
                    .map((e) => e.y)
                    .reduce((a, b) => a > b ? a : b) +
                10, // Establece el máximo y
            lineBarsData: [
              LineChartBarData(
                spots: historialAcciones,
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
    );
  }
}
