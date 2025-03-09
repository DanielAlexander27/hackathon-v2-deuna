import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensesPiechart extends StatelessWidget {
  const ExpensesPiechart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 0,
        sections:
            expenseDataList
                .map(
                  (expense) => PieChartSectionData(
                    value: expense.percent,
                    title: expense.category,
                    radius: 150,
                    titleStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    color: expense.color,
                  ),
                )
                .toList(),
      ),
    );
  }
}

final expenseDataList = [
  ExpenseData(category: 'Alimentación', percent: 40, color: Colors.red),
  ExpenseData(category: 'Educación', percent: 35, color: Colors.green),
  ExpenseData(category: 'Salud', percent: 25, color: Colors.blue),
];

class ExpenseData {
  final String category;
  final double percent;
  final Color color;

  const ExpenseData({
    required this.category,
    required this.percent,
    required this.color,
  });
}
