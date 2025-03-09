import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

class FutureCalculatorScreen extends StatelessWidget {
  const FutureCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        title: Text(
          'Calculadora del Futuro',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Balance Inicial',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Container(child: Row(children: [
          //     Container(child: Text('$'),)
          //   ],)),
          TextField(
            decoration: InputDecoration(
              icon: Container(),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
