import 'package:flutter/material.dart';

class ChasiumThinking extends StatelessWidget {
  const ChasiumThinking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFDED0F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 8),
                Text('Chasium esta pensando...'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
