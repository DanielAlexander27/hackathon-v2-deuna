import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/shared/app_bar_title.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';
import 'grafico_acciones.dart';

// Modelo de Empresa
class Empresa {
  final String nombre;
  final double valorAccion;
  final List<FlSpot> historialAcciones;

  Empresa({
    required this.nombre,
    required this.valorAccion,
    required this.historialAcciones,
  });
}

class EcuInvest extends StatelessWidget {
  // Lista de empresas con datos históricos
  final List<Empresa> empresas = [
    Empresa(
      nombre: 'Corporación la Favorita',
      valorAccion: 120.50,
      historialAcciones: [
        FlSpot(0, 120.50),
        FlSpot(1, 125.00),
        FlSpot(2, 130.80),
        FlSpot(3, 128.00),
        FlSpot(4, 135.00),
      ],
    ),
    Empresa(
      nombre: 'Ecuavisa',
      valorAccion: 85.75,
      historialAcciones: [
        FlSpot(0, 85.75),
        FlSpot(1, 90.20),
        FlSpot(2, 88.00),
        FlSpot(3, 89.50),
        FlSpot(4, 87.00),
      ],
    ),
    Empresa(
      nombre: 'Cervecería Nacional',
      valorAccion: 65.25,
      historialAcciones: [
        FlSpot(0, 65.25),
        FlSpot(1, 63.00),
        FlSpot(2, 62.50),
        FlSpot(3, 64.00),
        FlSpot(4, 66.00),
      ],
    ),
    Empresa(
      nombre: 'Banco Pichincha',
      valorAccion: 45.00,
      historialAcciones: [
        FlSpot(0, 45.00),
        FlSpot(1, 46.00),
        FlSpot(2, 44.50),
        FlSpot(3, 43.75),
        FlSpot(4, 45.50),
      ],
    ),
    Empresa(
      nombre: 'Tienda Veci',
      valorAccion: 10.00,
      historialAcciones: [
        FlSpot(0, 10.00),
        FlSpot(1, 9.50),
        FlSpot(2, 9.75),
        FlSpot(3, 10.25),
        FlSpot(4, 10.50),
      ],
    ),
  ];

  EcuInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(text: 'Inversiones Ecuatorianas'),
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: empresas.length,
        itemBuilder: (context, index) {
          final empresa = empresas[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            title: Text(
              empresa.nombre,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Valor de Acción: \$${empresa.valorAccion.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            trailing: Icon(Icons.trending_up, color: Colors.green),
            onTap: () {
              // Navegar a la pantalla de gráfico cuando se hace clic en la empresa
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => GraficoAcciones(
                        nombreEmpresa: empresa.nombre,
                        historialAcciones: empresa.historialAcciones,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
