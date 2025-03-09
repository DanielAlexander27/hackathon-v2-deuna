import 'package:flutter/material.dart';

class PromotionsView extends StatelessWidget {
  const PromotionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Promociones',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPromoCard(
            'Descuento en Supermercados',
            'Obtén 15% de cashback en tus compras de supermercado',
            Icons.shopping_cart,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildPromoCard(
            'Paga servicios sin comisión',
            'Paga tus servicios básicos sin comisión hasta el 30 de marzo',
            Icons.receipt_long,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildPromoCard(
            'Invita y gana',
            'Por cada amigo que invites, ambos reciben \$5',
            Icons.people,
            Colors.green,
          ),
          const SizedBox(height: 16),
          _buildPromoCard(
            'Descuento en Transporte',
            'Viaja con 20% de descuento en Metro de Quito',
            Icons.train,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
