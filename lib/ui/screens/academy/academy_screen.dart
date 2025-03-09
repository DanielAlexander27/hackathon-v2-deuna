import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import 'widgets/learning_modules.dart';

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
          Expanded(child: LearningModules()),
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
          const Text("42%", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    List<String> days = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            days.map((day) {
              bool isSelected =
                  day == 'Lunes' || day == 'Martes' || day == 'Miércoles';
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        isSelected ? Colors.green : Colors.grey[300],
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
}
