import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        title: const Text(
          'Academia',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildProgressBar(),
          _buildWeekDays(),
          Expanded(child: _buildModules()),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: 0.42, // Example progress value
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
            ),
          ),
          const SizedBox(width: 10),
          const Text("42%", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    List<String> days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days.map((day) {
          bool isSelected = day == 'Lunes' || day == 'Martes' || day == 'Miércoles';
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: isSelected ? Colors.green : Colors.grey[300],
                radius: 17,
              ),
              const SizedBox(height: 5),
              Text(day, style: const TextStyle(fontSize: 12)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildModules() {
    List<Map<String, dynamic>> modules = [
      {"title": "Presupuesto Personal", "description": "Aprende a organizar tus ingresos y gastos.", "icon": Icons.account_balance},
      {"title": "Ahorro Inteligente", "description": "Descubre estrategias para ahorrar mejor.", "icon": Icons.savings},
      {"title": "Inversiones Básicas", "description": "Conceptos clave para comenzar a invertir.", "icon": Icons.trending_up},
      {"title": "Créditos y Deudas", "description": "Cómo gestionar préstamos y evitar deudas malas.", "icon": Icons.credit_card},
      {"title": "Impuestos", "description": "Entiende los impuestos y cómo afectan tu dinero.", "icon": Icons.attach_money},
      {"title": "Inflación y Economía", "description": "Cómo la economía impacta tu bolsillo.", "icon": Icons.bar_chart},
      {"title": "Seguros", "description": "Protege tus bienes y salud con seguros adecuados.", "icon": Icons.security},
      {"title": "Jubilación y Pensiones", "description": "Planifica tu retiro desde hoy.", "icon": Icons.hourglass_bottom},
      {"title": "Educación Financiera", "description": "Conceptos clave para tomar mejores decisiones financieras.", "icon": Icons.school},
      {"title": "Mentalidad Financiera", "description": "Desarrolla hábitos para el éxito financiero.", "icon": Icons.psychology},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: modules.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(modules[index]["icon"], color: AppColors.purple),
                    const SizedBox(width: 10),
                    Text(modules[index]["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  modules[index]["description"],
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                  child: const Text('Empieza', style: TextStyle(color: Colors.black)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
