import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_v2_deuna/providers/ui/screens/future_calculator/future_calculator_view_model.dart';
import 'package:hackathon_v2_deuna/ui/screens/future_calculator/widgets/calculator_information.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import 'widgets/calculator_form.dart';

class FutureCalculatorScreen extends ConsumerWidget {
  const FutureCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(futureCalculatorViewModelProvider.notifier);
    final state = ref.watch(futureCalculatorViewModelProvider);

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CalculatorForm(viewModel: viewModel),
                SizedBox(height: 10),
                if (state != null)
                  CalculatorInformation(state: state),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
