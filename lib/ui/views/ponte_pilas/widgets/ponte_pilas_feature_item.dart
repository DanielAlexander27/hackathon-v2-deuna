import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import '../../../../router/destinations/route.dart';

class PontePilasFeatureItem extends StatelessWidget {
  final PontePilasFeature feature;

  const PontePilasFeatureItem({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 18),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => context.goNamed(feature.destination.path),
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFDED0F1),
            border: Border.all(color: Colors.black.withValues(alpha: 0.20)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(feature.icon, color: Colors.white, size: 30),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        feature.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(height: 0),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PontePilasFeature {
  final String title;
  final String description;
  final IconData icon;
  final DestinationRoute destination;

  const PontePilasFeature({
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
  });
}
