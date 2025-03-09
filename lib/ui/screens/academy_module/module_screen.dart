import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';
import 'package:hackathon_v2_deuna/ui/shared/custom/custom_elevated_button.dart';

class BudgetLessonScreen extends StatelessWidget {
  const BudgetLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        title: const Text('Presupuesto Personal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Qué es un presupuesto?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Un presupuesto es una herramienta que te ayuda a organizar tus ingresos y gastos para controlar tu dinero de manera efectiva.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(),
            const SizedBox(height: 16),
            _buildQuiz(context),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard() {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ejemplo:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
                        Text(
                          '''Ana recibe un salario de \$1,000 al mes. Ella distribuye su dinero de la siguiente forma:
            - 50% Necesidades (renta, comida, transporte)
            - 30% Deseos (entretenimiento, compras)
            - 20% Ahorro e inversiones''',
                          style: TextStyle(fontSize: 14),
                        ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuiz(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pregunta rápida:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          'Si ganas \$2,000 al mes y sigues la regla 50/30/20, ¿cuánto deberías ahorrar?',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElevatedButton(
              text: '\$400',
              onPressed: () => _showResultDialog(context, true),
            ),
            CustomElevatedButton(
              text: '\$600',
              onPressed: () => _showResultDialog(context, false),
            ),
          ],
        ),
      ],
    );
  }

  void _showResultDialog(BuildContext context, bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isCorrect ? '¡Correcto!' : 'Inténtalo de nuevo'),
          content: Text(isCorrect
              ? 'Ahorrar el 20% de \$2,000 equivale a \$400.'
              : 'Revisa la regla 50/30/20 y vuelve a intentarlo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
