import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/views/ponte_pilas/widgets/ponte_pilas_feature_item.dart';

import '../../../router/destinations/destinations.dart';

class PontePilasView extends StatelessWidget {
  const PontePilasView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pontePilasFeatures.length,
      itemBuilder: (context, index) {
        final feature = pontePilasFeatures[index];

        return PontePilasFeatureItem(feature: feature);
      },
    );
  }
}

const pontePilasFeatures = [
  PontePilasFeature(
    title: 'Análisis de Finanzas',
    description:
        'Analiza tus ingresos y gastos para entender de mejor manera cómo haces uso de tu dinero',
    icon: Icons.query_stats_rounded,
    destination: Destinations.financeAnalysis,
  ),
  PontePilasFeature(
    title: 'Calculadora del Futuro',
    description:
        '¿Quieres ver cómo tu dinero puede crecer a través del tiempo si ahorras mensualmente?',
    icon: Icons.calculate_rounded,
    destination: Destinations.futureCalculator,
  ),
  PontePilasFeature(
    title: 'Academia',
    description:
        'Aprende los conceptos clave de economía y finanzas para tomar el control de tu dinero',
    icon: Icons.school_rounded,
    destination: Destinations.academy,
  ),
  PontePilasFeature(
    title: 'Ecu-Invest',
    description:
        'Haz crecer tu dinero invirtiendo en la bolsa de valores o apoyando comercios locales.',
    icon: Icons.paid_rounded,
    destination: Destinations.ecuInvest
  ),
];
