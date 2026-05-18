import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatsCard extends StatelessWidget {
  final double currentTemp;
  final double humidity;

  const StatsCard({
    super.key,
    required this.currentTemp,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: VoraColors.surfaceContainerLow.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CURRENT',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: VoraColors.onSurfaceVariant,
                      letterSpacing: 1.5,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${currentTemp.toStringAsFixed(0)}°',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'C',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: VoraColors.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Container(
                width: 1,
                height: 48,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'HUMIDITY',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: VoraColors.onSurfaceVariant,
                      letterSpacing: 1.5,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: VoraColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${humidity.toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
