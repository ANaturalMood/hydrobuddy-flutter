import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/utils/settings_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadSettings());
  }

  Future<void> _loadSettings() async {
    await SettingsService.ensureInitialized();

    final volumeError =
        SettingsService.getDouble(SettingsService.keyVolumeError);
    if (volumeError != null) {
      ref.read(volumeErrorProvider.notifier).set(volumeError);
    }

    final weightError =
        SettingsService.getDouble(SettingsService.keyWeightError);
    if (weightError != null) {
      ref.read(weightErrorProvider.notifier).set(weightError);
    }

    final defaultVolume =
        SettingsService.getDouble(SettingsService.keyDefaultVolume);
    if (defaultVolume != null) {
      ref.read(volumeLitersProvider.notifier).set(defaultVolume);
    }

    final defaultConcUnit =
        SettingsService.getString(SettingsService.keyDefaultConcUnit);
    if (defaultConcUnit != null) {
      ref.read(concentrationUnitProvider.notifier).set(
            calc.ConcUnit.values.firstWhere(
              (e) => e.name == defaultConcUnit,
              orElse: () => calc.ConcUnit.ppm,
            ),
          );
    }

    final defaultWeightUnit =
        SettingsService.getString(SettingsService.keyDefaultWeightUnit);
    if (defaultWeightUnit != null) {
      ref.read(weightUnitProvider.notifier).set(
            calc.WeightUnit.values.firstWhere(
              (e) => e.name == defaultWeightUnit,
              orElse: () => calc.WeightUnit.gram,
            ),
          );
    }

    final calcMode = SettingsService.getString(SettingsService.keyCalcMode);
    if (calcMode != null) {
      ref.read(calculationModeProvider.notifier).set(
            calc.CalcMode.values.firstWhere(
              (e) => e.name == calcMode,
              orElse: () => calc.CalcMode.directAddition,
            ),
          );
    }

    final solutionMode =
        SettingsService.getString(SettingsService.keySolutionMode);
    if (solutionMode != null) {
      ref.read(solutionModeProvider.notifier).set(
            calc.SolutionMode.values.firstWhere(
              (e) => e.name == solutionMode,
              orElse: () => calc.SolutionMode.directAddition,
            ),
          );
    }

    final ecModel = SettingsService.getString(SettingsService.keyEcModel);
    if (ecModel != null) {
      ref.read(ecModelProvider.notifier).set(
            calc.EcModel.values.firstWhere(
              (e) => e.name == ecModel,
              orElse: () => calc.EcModel.lmcv2,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<double>(volumeErrorProvider, (_, next) {
      unawaited(
        SettingsService.setDouble(SettingsService.keyVolumeError, next),
      );
    });
    ref.listen<double>(weightErrorProvider, (_, next) {
      unawaited(
        SettingsService.setDouble(SettingsService.keyWeightError, next),
      );
    });
    ref.listen<double>(volumeLitersProvider, (_, next) {
      unawaited(
        SettingsService.setDouble(SettingsService.keyDefaultVolume, next),
      );
    });
    ref.listen<calc.ConcUnit>(concentrationUnitProvider, (_, next) {
      unawaited(
        SettingsService.setString(SettingsService.keyDefaultConcUnit, next.name),
      );
    });
    ref.listen<calc.WeightUnit>(weightUnitProvider, (_, next) {
      unawaited(
        SettingsService.setString(
            SettingsService.keyDefaultWeightUnit, next.name),
      );
    });
    ref.listen<calc.CalcMode>(calculationModeProvider, (_, next) {
      unawaited(
        SettingsService.setString(SettingsService.keyCalcMode, next.name),
      );
    });
    ref.listen<calc.SolutionMode>(solutionModeProvider, (_, next) {
      unawaited(
        SettingsService.setString(SettingsService.keySolutionMode, next.name),
      );
    });
    ref.listen<calc.EcModel>(ecModelProvider, (_, next) {
      unawaited(
        SettingsService.setString(SettingsService.keyEcModel, next.name),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: ListView(
        children: [
          _SettingsTile(
            icon: Icons.biotech_outlined,
            title: AppLocalizations.of(context)!.instrumentPrecision,
            onTap: () => context.push('/settings/instrument-precision'),
          ),
          _SettingsTile(
            icon: Icons.functions_outlined,
            title: AppLocalizations.of(context)!.degreeOfFreedom,
            onTap: () => context.push('/settings/degree-of-freedom'),
          ),
          _SettingsTile(
            icon: Icons.water_drop_outlined,
            title: AppLocalizations.of(context)!.waterQuality,
            onTap: () => context.push('/water-quality'),
          ),
          _SettingsTile(
            icon: Icons.science_outlined,
            title: AppLocalizations.of(context)!.tissueAnalysis,
            onTap: () => context.push('/tissue'),
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: AppLocalizations.of(context)!.aboutHydroBuddy,
            onTap: () => context.push('/settings/about'),
          ),
          _SettingsTile(
            icon: Icons.language_outlined,
            title: AppLocalizations.of(context)!.language,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.comingSoon)),
              );
            },
          ),
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: AppLocalizations.of(context)!.theme,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.comingSoon)),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
