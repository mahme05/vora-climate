import 'package:flutter/material.dart';
import '../models/climate_state.dart';
import '../theme/app_theme.dart';

class ModeSelector extends StatelessWidget {
  final AcMode selectedMode;
  final bool isPoweredOn;
  final ValueChanged<AcMode> onChanged;

  const ModeSelector({
    super.key,
    required this.selectedMode,
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
            children: [
              const Icon(Icons.dashboard_customize_outlined,
                  color: VoraColors.onSurfaceVariant, size: 20),
              const SizedBox(width: 8),
              Text(
                'Mode',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: VoraColors.onSurface,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AnimatedOpacity(
            opacity: isPoweredOn ? 1.0 : 0.4,
            duration: const Duration(milliseconds: 300),
            child: Row(
              children: [
                _ModeButton(
                  mode: AcMode.cooling,
                  icon: Icons.ac_unit,
                  label: 'Cool',
                  isSelected: selectedMode == AcMode.cooling,
                  onTap: () => onChanged(AcMode.cooling),
                ),
                const SizedBox(width: 8),
                _ModeButton(
                  mode: AcMode.heating,
                  icon: Icons.local_fire_department,
                  label: 'Heat',
                  isSelected: selectedMode == AcMode.heating,
                  onTap: () => onChanged(AcMode.heating),
                  activeColor: VoraColors.tertiary,
                  activeBg: VoraColors.tertiaryContainer,
                ),
                const SizedBox(width: 8),
                _ModeButton(
                  mode: AcMode.dry,
                  icon: Icons.water_drop_outlined,
                  label: 'Dry',
                  isSelected: selectedMode == AcMode.dry,
                  onTap: () => onChanged(AcMode.dry),
                ),
                const SizedBox(width: 8),
                _ModeButton(
                  mode: AcMode.eco,
                  icon: Icons.eco_outlined,
                  label: 'Eco',
                  isSelected: selectedMode == AcMode.eco,
                  onTap: () => onChanged(AcMode.eco),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final AcMode mode;
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;
  final Color activeBg;

  const _ModeButton({
    required this.mode,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.activeColor = VoraColors.primary,
    this.activeBg = VoraColors.primaryContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? activeBg.withOpacity(0.25)
                : VoraColors.surfaceDim,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? activeColor.withOpacity(0.4)
                  : Colors.white.withOpacity(0.05),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? activeColor : VoraColors.onSurfaceVariant,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isSelected
                          ? activeColor
                          : VoraColors.onSurfaceVariant,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
