import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/climate_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/stats_card.dart';
import '../widgets/temp_dial.dart';
import '../widgets/fan_speed_selector.dart';
import '../widgets/mode_selector.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoraColors.background,
      body: Consumer<ClimateProvider>(
        builder: (context, provider, _) {
          final state = provider.state;
          return Column(
            children: [
              _buildAppBar(context),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                  child: Column(
                    children: [
                      StatsCard(
                        currentTemp: state.currentTemp,
                        humidity: state.humidity,
                      ),

                      const SizedBox(height: 48),

                      TempDial(
                        targetTemp: state.targetTemp,
                        isPoweredOn: state.isPoweredOn,
                        mode: state.mode,
                        onIncrease: provider.increaseTemp,
                        onDecrease: provider.decreaseTemp,
                        onTogglePower: provider.togglePower,
                      ),

                      const SizedBox(height: 48),

                      FanSpeedSelector(
                        selectedSpeed: state.fanSpeed,
                        isPoweredOn: state.isPoweredOn,
                        onChanged: provider.setFanSpeed,
                      ),

                      const SizedBox(height: 12),

                      ModeSelector(
                        selectedMode: state.mode,
                        isPoweredOn: state.isPoweredOn,
                        onChanged: provider.setMode,
                      ),
                    ],
                  ),
                ),
              ),

              const VoraBottomNav(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        color: VoraColors.surfaceDim.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: VoraColors.onSurfaceVariant),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),

            const Expanded(
              child: Center(
                child: Text(
                  'Living Room',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: VoraColors.onSurface,
                  ),
                ),
              ),
            ),

            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: VoraColors.surfaceContainerHighest,
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: const Icon(
                Icons.person_outline,
                color: VoraColors.onSurfaceVariant,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
