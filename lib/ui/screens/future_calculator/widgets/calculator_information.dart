import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../providers/ui/screens/future_calculator/future_calculator_view_model.dart';

class CalculatorInformation extends StatelessWidget {
  final FutureCalculatorUiState state;

  const CalculatorInformation({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 251, 251, 1),
        border: Border.all(color: Colors.black.withValues(alpha: 0.10)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Puedes ahorrar', style: TextStyle(height: 0)),
          Text(
            _formatQuantity(state.total),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 0,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final radius = constraints.maxWidth * 0.38;

                return PieChart(
                  PieChartData(
                    centerSpaceRadius: 0,
                    sectionsSpace: 1,
                    // centerSpaceColor: Colors.red,
                    sections: [
                      PieChartSectionData(
                        value: state.initialBalance,
                        showTitle: true,
                        title: _formatQuantity(state.initialBalance),
                        radius: radius,
                        color: initialBalanceColor,
                        titleStyle: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        value: state.monthlyDepositTotal,
                        showTitle: true,
                        title: _formatQuantity(state.monthlyDepositTotal),
                        radius: radius,
                        color: monthlyDepositTotal,
                        titleStyle: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        value: state.interestEarned,
                        showTitle: true,
                        title: _formatQuantity(state.interestEarned),
                        radius: radius,
                        color: interestEarnedColor,
                        titleStyle: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              _Indicator(color: initialBalanceColor, title: 'Balance Inicial'),
              Spacer(),
              _Indicator(
                color: monthlyDepositTotal,
                title: 'Depósitos Periódicos',
              ),
            ],
          ),
          const SizedBox(height: 4),
          _Indicator(color: interestEarnedColor, title: 'Interés total'),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final String title;
  final Color color;

  const _Indicator({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(color: color),
        ),
        SizedBox(width: 5),
        Text(title),
      ],
    );
  }
}

final initialBalanceColor = Color.fromRGBO(194, 87, 244, 1);
final monthlyDepositTotal = Color.fromRGBO(73, 80, 224, 1);
final interestEarnedColor = Color.fromRGBO(40, 204, 112, 1);

String _formatQuantity(double price) {
  return NumberFormat.currency(
    symbol: '\$', // Change to '€' or '£' if needed
    decimalDigits: 2, // Number of decimal places
  ).format(price);
}
