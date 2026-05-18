import 'package:flutter/material.dart';
import '../models/climate_state.dart';
import '../theme/app_theme.dart';

class TempDial extends StatelessWidget {
  final double targetTemp;
  final bool isPoweredOn;
  final AcMode mode;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onTogglePower;

  const TempDial({
    super.key,
    required this.targetTemp,
    required this.isPoweredOn,
    required this.mode,
    required this.onIncrease,
    required this.onDecrease,
    required this.onTogglePower,
  });

  IconData get _modeIcon {
    switch (mode) {
      case AcMode.cooling:
        return Icons.ac_unit;
      case AcMode.heating:
        return Icons.local_fire_department;
      case AcMode.dry:
        return Icons.water_drop_outlined;
      case AcMode.eco:
        return Icons.eco;
    }
  }

  Color get _modeColor {
    switch (mode) {
      case AcMode.heating:
        return VoraColors.tertiary;
      default:
        return VoraColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialColor = isPoweredOn ? _modeColor : VoraColors.onSurfaceVariant;

    return SizedBox(
      width: 290,
      height: 290,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 290,
            height: 290,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  VoraColors.surfaceContainerLow,
                  VoraColors.background,
                ],
              ),
              border: Border.all(
                color: VoraColors.surfaceContainerHigh,
                width: 1,
              ),
              boxShadow: isPoweredOn
                  ? [
                      BoxShadow(
                        color: dialColor.withOpacity(0.15),
                        blurRadius: 60,
                        spreadRadius: 10,
                      )
                    ]
                  : [],
            ),
          ),

          Container(
            width: 258,
            height: 258,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: VoraColors.surfaceContainerLow,
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'TARGET',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isPoweredOn ? dialColor : VoraColors.onSurfaceVariant,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                  color: isPoweredOn ? VoraColors.onSurface : VoraColors.onSurfaceVariant,
                  letterSpacing: -2,
                  height: 1.0,
                ),
                child: Text(targetTemp.toStringAsFixed(1)),
              ),

              Text(
                '°C',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: VoraColors.onSurfaceVariant,
                    ),
              ),

              const SizedBox(height: 12),

              AnimatedOpacity(
                opacity: isPoweredOn ? 1.0 : 0.4,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: dialColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: dialColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_modeIcon, color: dialColor, size: 14),
                      const SizedBox(width: 6),
                      Text(
                        mode.name[0].toUpperCase() + mode.name.substring(1),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: dialColor,
                              letterSpacing: 0.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: -20,
            child: _DialButton(
              onTap: onDecrease,
              child: const Icon(Icons.remove, color: VoraColors.onSurface, size: 28),
            ),
          ),

          Positioned(
            right: -20,
            child: _DialButton(
              onTap: onIncrease,
              child: const Icon(Icons.add, color: VoraColors.onSurface, size: 28),
            ),
          ),

          Positioned(
            bottom: -24,
            child: GestureDetector(
              onTap: onTogglePower,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPoweredOn
                      ? VoraColors.primaryContainer
                      : VoraColors.surfaceContainerHigh,
                  border: Border.all(
                    color: isPoweredOn
                        ? VoraColors.primary.withOpacity(0.4)
                        : Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                  boxShadow: isPoweredOn
                      ? [
                          BoxShadow(
                            color: VoraColors.primary.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ]
                      : [],
                ),
                child: Icon(
                  Icons.power_settings_new,
                  color: isPoweredOn ? VoraColors.primary : VoraColors.onSurfaceVariant,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DialButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const _DialButton({required this.onTap, required this.child});

  @override
  State<_DialButton> createState() => _DialButtonState();
}

class _DialButtonState extends State<_DialButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: VoraColors.surfaceContainer,
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
