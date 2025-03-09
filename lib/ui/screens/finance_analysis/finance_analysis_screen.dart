import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_v2_deuna/providers/ui/screens/future_calculator/future_calculator_view_model.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

class FinanceAnalysisScreen extends ConsumerWidget {
  const FinanceAnalysisScreen({super.key});

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
          'Cuida tus finanzas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingresos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingresos por fuente',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              StatusEarnings(),
            ],
                ),
              )
            ],
          ),
              ),
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Egresos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Egresos por categoría de consumo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              StatusConsume(),
            ],
                ),
              ),
            ],
          ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}

class StatusConsume extends ConsumerWidget {
  const StatusConsume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataConsumeProvider);

    return data.when(
      data: (consumeData) {
        final groupedData = _groupDataByCategory(consumeData);
        final pieChartSections = _generatePieChartSections(
          context,
          groupedData,
        );

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: PieChart(
              PieChartData(
                sections: pieChartSections,
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                borderData: FlBorderData(show: false),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event is FlTapUpEvent &&
                        pieTouchResponse != null &&
                        pieTouchResponse.touchedSection != null) {
                      final touchedSection = pieTouchResponse.touchedSection!;
                      final entry = groupedData.entries.elementAt(
                        touchedSection.touchedSectionIndex,
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Detalle de la categoría'),
                            content: Text(
                              'Categoría de consumo: ${entry.key}\nMonto debitado: ${entry.value}',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cerrar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }

  Map<String, double> _groupDataByCategory(List<ConsumeData> data) {
    final Map<String, double> groupedData = {};
    for (var item in data) {
      if (groupedData.containsKey(item.category)) {
        groupedData[item.category] = groupedData[item.category]! + item.amount;
      } else {
        groupedData[item.category] = item.amount;
      }
    }
    return groupedData;
  }

  List<PieChartSectionData> _generatePieChartSections(
    BuildContext context,
    Map<String, double> groupedData,
  ) {
    return groupedData.entries.map((entry) {
      final percentage =
          (entry.value / groupedData.values.reduce((a, b) => a + b)) * 100;
      return PieChartSectionData(
        color: _getColorForCategory(entry.value),
        value: entry.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Detalle de la categoría'),
                  content: Text(
                    'Categoría de consumo: ${entry.key}\nMonto Debitado: ${entry.value}',
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(),
        ),
      );
    }).toList();
  }

  Color _getColorForCategory(double amount) {
    final hue =
        (amount * 137.5) %
        360; // Use golden angle approximation for color distribution
    return HSVColor.fromAHSV(1.0, hue, 0.6, 0.9).toColor();
  }
}

final userDataConsumeProvider = FutureProvider<List<ConsumeData>>((ref) async {
  final String response = await rootBundle.loadString(
    'lib/assets/userDataConsume.json',
  );
  final List<dynamic> data = json.decode(response);
  return data.map((json) => ConsumeData.fromJson(json)).toList();
});

class ConsumeData {
  final String category;
  final double amount;

  ConsumeData({required this.category, required this.amount});

  factory ConsumeData.fromJson(Map<String, dynamic> json) {
    return ConsumeData(
      category: json['categoría'],
      amount: json['monto'].toDouble(),
    );
  }
}

class StatusEarnings extends ConsumerWidget {
  const StatusEarnings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataEarningsProvider);

    return data.when(
      data: (earningsData) {
        final groupedData = _groupDataByCategory(earningsData);
        final pieChartSections = _generatePieChartSections(
          context,
          groupedData,
        );

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: PieChart(
              PieChartData(
                sections: pieChartSections,
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                borderData: FlBorderData(show: false),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event is FlTapUpEvent &&
                        pieTouchResponse != null &&
                        pieTouchResponse.touchedSection != null) {
                      final touchedSection = pieTouchResponse.touchedSection!;
                      final entry = groupedData.entries.elementAt(
                        touchedSection.touchedSectionIndex,
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Detalle de la fuente de ingresos'),
                            content: Text(
                              'Fuente de ingresos: ${entry.key}\nMonto acreditado: ${entry.value}',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cerrar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }

  Map<String, double> _groupDataByCategory(List<EarningsData> data) {
    final Map<String, double> groupedData = {};
    for (var item in data) {
      if (groupedData.containsKey(item.category)) {
        groupedData[item.category] = groupedData[item.category]! + item.amount;
      } else {
        groupedData[item.category] = item.amount;
      }
    }
    return groupedData;
  }

  List<PieChartSectionData> _generatePieChartSections(
    BuildContext context,
    Map<String, double> groupedData,
  ) {
    return groupedData.entries.map((entry) {
      final percentage =
          (entry.value / groupedData.values.reduce((a, b) => a + b)) * 100;
      return PieChartSectionData(
        color: _getColorForCategory(entry.value),
        value: entry.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Detalle de la fuente de ingresos'),
                  content: Text(
                    'Fuente de ingresos: ${entry.key}\nMonto acreditado: ${entry.value}',
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(),
        ),
      );
    }).toList();
  }

  Color _getColorForCategory(double amount) {
    final hue =
        (amount * 137.5) %
        360; // Use golden angle approximation for color distribution
    return HSVColor.fromAHSV(1.0, hue, 0.6, 0.9).toColor();
  }
}

final userDataEarningsProvider = FutureProvider<List<EarningsData>>((
  ref,
) async {
  final String response = await rootBundle.loadString(
    'lib/assets/userDataEarnings.json',
  );
  final List<dynamic> data = json.decode(response);
  return data.map((json) => EarningsData.fromJson(json)).toList();
});

class EarningsData {
  final String category;
  final double amount;

  EarningsData({required this.category, required this.amount});

  factory EarningsData.fromJson(Map<String, dynamic> json) {
    return EarningsData(
      category: json['fuente'],
      amount: json['monto'].toDouble(),
    );
  }
}
