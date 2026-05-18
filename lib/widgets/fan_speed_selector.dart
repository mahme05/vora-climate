import 'package:flutter/material.dart';
import '../models/climate_state.dart';
import '../theme/app_theme.dart';

class FanSpeedSelector extends StatelessWidget {
  final FanSpeed selectedSpeed;
  final bool isPoweredOn;
  final ValueChanged<FanSpeed> onChanged;

  const FanSpeedSelector({
    super.key,
    required this.selectedSpeed,
    required this.isPoweredOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VoraColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.air,
                    color: VoraColors.onSurfaceVariant,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Fan Speed',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: VoraColors.onSurface,
                        ),
                  ),
                ],
              ),
              Text(
                'Auto',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: VoraColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          AnimatedOpacity(
            opacity: isPoweredOn ? 1.0 : 0.4,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: VoraColors.surfaceDim,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Row(
                children: FanSpeed.values
                    .map((speed) => _SpeedButton(
                          label: speed == FanSpeed.low
                              ? 'Low'
                              : speed == FanSpeed.medium
                                  ? 'Med'
                                  : 'High',
                          isSelected: selectedSpeed == speed,
                          onTap: () => onChanged(speed),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeedButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SpeedButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? VoraColors.primaryContainer.withOpacity(0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(color: VoraColors.primary.withOpacity(0.3))
                : Border.all(color: Colors.transparent),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isSelected
                        ? VoraColors.primary
                        : VoraColors.onSurfaceVariant,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
