import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart' show AppColors;
import 'package:hackathon_v2_deuna/ui/shared/custom/custom_elevated_button.dart';
import 'package:hackathon_v2_deuna/router/destinations/destinations.dart';

class LearningModules extends StatelessWidget {
  const LearningModules({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: modules.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(modules[index]["icon"], color: AppColors.purple),
                    const SizedBox(width: 10),
                    Text(
                      modules[index]["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  modules[index]["description"],
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  text: "Comenzar",
                  onPressed: () {
                    context.goNamed(Destinations.budgetLesson.path);
                  },

                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Map<String, dynamic>> modules = [
  {
    "title": "Presupuesto Personal",
    "description": "Aprende a organizar tus ingresos y gastos.",
    "icon": Icons.account_balance,
  },
  {
    "title": "Ahorro Inteligente",
    "description": "Descubre estrategias para ahorrar mejor.",
    "icon": Icons.savings,
  },
  {
    "title": "Inversiones Básicas",
    "description": "Conceptos clave para comenzar a invertir.",
    "icon": Icons.trending_up,
  },
  {
    "title": "Créditos y Deudas",
    "description": "Cómo gestionar préstamos y evitar deudas malas.",
    "icon": Icons.credit_card,
  },
  {
    "title": "Impuestos",
    "description": "Entiende los impuestos y cómo afectan tu dinero.",
    "icon": Icons.attach_money,
  },
  {
    "title": "Inflación y Economía",
    "description": "Cómo la economía impacta tu bolsillo.",
    "icon": Icons.bar_chart,
  },
  {
    "title": "Seguros",
    "description": "Protege tus bienes y salud con seguros adecuados.",
    "icon": Icons.security,
  },
  {
    "title": "Jubilación y Pensiones",
    "description": "Planifica tu retiro desde hoy.",
    "icon": Icons.hourglass_bottom,
  },
  {
    "title": "Educación Financiera",
    "description": "Conceptos clave para tomar mejores decisiones financieras.",
    "icon": Icons.school,
  },
  {
    "title": "Mentalidad Financiera",
    "description": "Desarrolla hábitos para el éxito financiero.",
    "icon": Icons.psychology,
  },
];
