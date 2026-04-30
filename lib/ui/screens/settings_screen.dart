import 'dart:async';

import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';
import 'package:hydrobuddy/utils/settings_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _volumePrecisionController = TextEditingController(text: '0.1');
  final _weightPrecisionController = TextEditingController(text: '0.01');

  final _nController = TextEditingController();
  final _pController = TextEditingController();
  final _kController = TextEditingController();
  final _caController = TextEditingController();
  final _mgController = TextEditingController();
  final _sController = TextEditingController();
  final _ecController = TextEditingController();
  final _phController = TextEditingController();

  int? _selectedWaterQualityId;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadSettings());
  }

  @override
  void dispose() {
    _volumePrecisionController.dispose();
    _weightPrecisionController.dispose();
    _nController.dispose();
    _pController.dispose();
    _kController.dispose();
    _caController.dispose();
    _mgController.dispose();
    _sController.dispose();
    _ecController.dispose();
    _phController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    await SettingsService.ensureInitialized();

    final volumeError = SettingsService.getDouble(SettingsService.keyVolumeError);
    if (volumeError != null) {
      _volumePrecisionController.text = volumeError.toString();
      ref.read(volumeErrorProvider.notifier).set(volumeError);
    }

    final weightError = SettingsService.getDouble(SettingsService.keyWeightError);
    if (weightError != null) {
      _weightPrecisionController.text = weightError.toString();
      ref.read(weightErrorProvider.notifier).set(weightError);
    }

    final defaultConcUnit = SettingsService.getString(SettingsService.keyDefaultConcUnit);
    if (defaultConcUnit != null) {
      ref.read(concentrationUnitProvider.notifier).set(
        calc.ConcUnit.values.firstWhere(
          (e) => e.name == defaultConcUnit,
          orElse: () => calc.ConcUnit.ppm,
        ),
      );
    }

    final defaultWeightUnit = SettingsService.getString(SettingsService.keyDefaultWeightUnit);
    if (defaultWeightUnit != null) {
      ref.read(weightUnitProvider.notifier).set(
        calc.WeightUnit.values.firstWhere(
          (e) => e.name == defaultWeightUnit,
          orElse: () => calc.WeightUnit.gram,
        ),
      );
    }

    final wqId = SettingsService.getInt('waterQualityId');
    if (wqId != null) {
      _selectedWaterQualityId = wqId;
      ref.read(waterQualityIdProvider.notifier).set(wqId);
    }

    setState(() => _loaded = true);
  }

  void _onWaterQualitySelected(int? id) {
    setState(() => _selectedWaterQualityId = id);
    if (id != null) {
      ref.read(waterQualityIdProvider.notifier).set(id);
      _populateWaterQualityFields();
    } else {
      _clearWaterQualityFields();
    }
  }

  void _populateWaterQualityFields() {
    final wq = _findSelectedWq();
    if (wq == null) return;
    _nController.text = (wq.n_no3 + wq.n_nh4).toStringAsFixed(1);
    _pController.text = wq.p.toStringAsFixed(1);
    _kController.text = wq.k.toStringAsFixed(1);
    _caController.text = wq.ca.toStringAsFixed(1);
    _mgController.text = wq.mg.toStringAsFixed(1);
    _sController.text = wq.s.toStringAsFixed(1);
    _phController.text = (wq.ph ?? 7.0).toStringAsFixed(1);
  }

  void _clearWaterQualityFields() {
    _nController.clear();
    _pController.clear();
    _kController.clear();
    _caController.clear();
    _mgController.clear();
    _sController.clear();
    _ecController.clear();
    _phController.clear();
  }

  db.WaterQualityData? _findSelectedWq() {
    if (_selectedWaterQualityId == null) return null;
    final wqs = ref.read(watchWaterQualitiesProvider).valueOrNull ?? [];
    return wqs.where((w) => w.id == _selectedWaterQualityId).firstOrNull;
  }

  void _onSave() {
    final volumeError = double.tryParse(_volumePrecisionController.text);
    if (volumeError != null) {
      ref.read(volumeErrorProvider.notifier).set(volumeError);
      unawaited(SettingsService.setDouble(SettingsService.keyVolumeError, volumeError));
    }

    final weightError = double.tryParse(_weightPrecisionController.text);
    if (weightError != null) {
      ref.read(weightErrorProvider.notifier).set(weightError);
      unawaited(SettingsService.setDouble(SettingsService.keyWeightError, weightError));
    }

    final concUnit = ref.read(concentrationUnitProvider);
    unawaited(SettingsService.setString(SettingsService.keyDefaultConcUnit, concUnit.name));

    final weightUnit = ref.read(weightUnitProvider);
    unawaited(SettingsService.setString(SettingsService.keyDefaultWeightUnit, weightUnit.name));

    if (_selectedWaterQualityId != null) {
      unawaited(SettingsService.setInt('waterQualityId', _selectedWaterQualityId!));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved')),
    );
  }

  void _onReset() {
    _volumePrecisionController.text = '0.1';
    _weightPrecisionController.text = '0.01';
    _selectedWaterQualityId = null;
    _clearWaterQualityFields();
    ref.read(volumeErrorProvider.notifier).set(0.1);
    ref.read(weightErrorProvider.notifier).set(0.01);
    ref.read(concentrationUnitProvider.notifier).set(calc.ConcUnit.ppm);
    ref.read(weightUnitProvider.notifier).set(calc.WeightUnit.gram);
    ref.read(waterQualityIdProvider.notifier).set(null);
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings reset to defaults')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final waterQualitiesAsync = ref.watch(watchWaterQualitiesProvider);
    final waterQualities = waterQualitiesAsync.valueOrNull ?? <db.WaterQualityData>[];
    final selectedWq = _findSelectedWq();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80, bottom: 100, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroSection(isDesktop: MediaQuery.of(context).size.width >= 768, colorScheme: colorScheme),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth >= 1024;
                    if (isDesktop) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _WaterAnalysisCard(
                                  colorScheme: colorScheme,
                                  waterQualities: waterQualities,
                                  selectedWaterQualityId: _selectedWaterQualityId,
                                  onWaterQualitySelected: _onWaterQualitySelected,
                                  selectedWq: selectedWq,
                                  nController: _nController,
                                  pController: _pController,
                                  kController: _kController,
                                  caController: _caController,
                                  mgController: _mgController,
                                  sController: _sController,
                                  ecController: _ecController,
                                  phController: _phController,
                                ),
                                const SizedBox(height: 20),
                                _InstrumentPrecisionCard(
                                  colorScheme: colorScheme,
                                  volumePrecisionController: _volumePrecisionController,
                                  weightPrecisionController: _weightPrecisionController,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 320,
                            child: Column(
                              children: [
                                _PreferencesCard(colorScheme: colorScheme),
                                const SizedBox(height: 20),
                                _AboutCard(colorScheme: colorScheme),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        _WaterAnalysisCard(
                          colorScheme: colorScheme,
                          waterQualities: waterQualities,
                          selectedWaterQualityId: _selectedWaterQualityId,
                          onWaterQualitySelected: _onWaterQualitySelected,
                          selectedWq: selectedWq,
                          nController: _nController,
                          pController: _pController,
                          kController: _kController,
                          caController: _caController,
                          mgController: _mgController,
                          sController: _sController,
                          ecController: _ecController,
                          phController: _phController,
                        ),
                        const SizedBox(height: 20),
                        _InstrumentPrecisionCard(
                          colorScheme: colorScheme,
                          volumePrecisionController: _volumePrecisionController,
                          weightPrecisionController: _weightPrecisionController,
                        ),
                        const SizedBox(height: 20),
                        _PreferencesCard(colorScheme: colorScheme),
                        const SizedBox(height: 20),
                        _AboutCard(colorScheme: colorScheme),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                _ActionBar(colorScheme: colorScheme, onReset: _onReset, onSave: _onSave),
              ],
            ),
          ),
          Positioned(
            top: 0, left: 0, right: 0,
            child: _AppBar(colorScheme: colorScheme),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final ColorScheme colorScheme;
  const _AppBar({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          Icon(Icons.science, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            'HydroBuddy',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: colorScheme.onSurfaceVariant),
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: colorScheme.primaryContainer,
            child: Text(
              'JD',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final bool isDesktop;
  final ColorScheme colorScheme;
  const _HeroSection({required this.isDesktop, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configuration & Lab Setup',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.02,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Define your source water chemistry and instrument tolerances to ensure the highest degree of calculation accuracy for your hydroponic nutrients.',
                style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        if (isDesktop) ...[
          const SizedBox(width: 20),
          Expanded(
            flex: 5,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceContainer,
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Center(
                child: Icon(
                  Icons.science,
                  size: 72,
                  color: colorScheme.primary.withOpacity(0.25),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _WaterAnalysisCard extends StatelessWidget {
  final ColorScheme colorScheme;
  final List<db.WaterQualityData> waterQualities;
  final int? selectedWaterQualityId;
  final ValueChanged<int?> onWaterQualitySelected;
  final db.WaterQualityData? selectedWq;
  final TextEditingController nController;
  final TextEditingController pController;
  final TextEditingController kController;
  final TextEditingController caController;
  final TextEditingController mgController;
  final TextEditingController sController;
  final TextEditingController ecController;
  final TextEditingController phController;

  const _WaterAnalysisCard({
    required this.colorScheme,
    required this.waterQualities,
    required this.selectedWaterQualityId,
    required this.onWaterQualitySelected,
    required this.selectedWq,
    required this.nController,
    required this.pController,
    required this.kController,
    required this.caController,
    required this.mgController,
    required this.sController,
    required this.ecController,
    required this.phController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.water_drop, color: colorScheme.primary),
              const SizedBox(width: 12),
              Text(
                'Baseline Water Analysis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Enter the parts per million (ppm) of elements already present in your tap or source water.',
            style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: selectedWaterQualityId,
            decoration: InputDecoration(
              labelText: 'Water Profile',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            items: [
              const DropdownMenuItem(value: null, child: Text('Select profile...')),
              ...waterQualities.map((w) => DropdownMenuItem(
                value: w.id,
                child: Text(w.name),
              )),
            ],
            onChanged: onWaterQualitySelected,
          ),
          if (selectedWq != null) ...[
            const SizedBox(height: 16),
            _ElementInputsGrid(colorScheme: colorScheme, selectedWq: selectedWq!, nController: nController, pController: pController, kController: kController, caController: caController, mgController: mgController, sController: sController, ecController: ecController, phController: phController),
          ],
        ],
      ),
    );
  }
}

class _ElementInputsGrid extends StatelessWidget {
  final ColorScheme colorScheme;
  final db.WaterQualityData selectedWq;
  final TextEditingController nController;
  final TextEditingController pController;
  final TextEditingController kController;
  final TextEditingController caController;
  final TextEditingController mgController;
  final TextEditingController sController;
  final TextEditingController ecController;
  final TextEditingController phController;

  const _ElementInputsGrid({
    required this.colorScheme,
    required this.selectedWq,
    required this.nController,
    required this.pController,
    required this.kController,
    required this.caController,
    required this.mgController,
    required this.sController,
    required this.ecController,
    required this.phController,
  });

  @override
  Widget build(BuildContext context) {
    final entries = [
      _ElementInput(label: 'N', title: 'Nitrogen', controller: nController, isPrimary: true),
      _ElementInput(label: 'P', title: 'Phosphorus', controller: pController, isPrimary: true),
      _ElementInput(label: 'K', title: 'Potassium', controller: kController, isPrimary: true),
      _ElementInput(label: 'Ca', title: 'Calcium', controller: caController, isPrimary: true),
      _ElementInput(label: 'Mg', title: 'Magnesium', controller: mgController, isPrimary: true),
      _ElementInput(label: 'S', title: 'Sulfur', controller: sController, isPrimary: true),
      _ElementInput(label: 'EC', title: 'Conductivity', controller: ecController, isPrimary: false),
      _ElementInput(label: 'pH', title: 'Acidity', controller: phController, isPrimary: false),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 600 ? 4 : (constraints.maxWidth >= 400 ? 3 : 2);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2.2,
          ),
          itemCount: entries.length,
          itemBuilder: (context, index) => _buildInput(entries[index]),
        );
      },
    );
  }

  Widget _buildInput(_ElementInput entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: entry.isPrimary ? colorScheme.primary : colorScheme.tertiary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                entry.label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: entry.isPrimary ? colorScheme.onPrimary : colorScheme.onTertiary,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(entry.title, style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant)),
          ],
        ),
        const SizedBox(height: 4),
        TextField(
          controller: entry.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0.0',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            isDense: true,
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class _ElementInput {
  final String label;
  final String title;
  final TextEditingController controller;
  final bool isPrimary;
  const _ElementInput({required this.label, required this.title, required this.controller, required this.isPrimary});
}

class _InstrumentPrecisionCard extends StatelessWidget {
  final ColorScheme colorScheme;
  final TextEditingController volumePrecisionController;
  final TextEditingController weightPrecisionController;
  const _InstrumentPrecisionCard({required this.colorScheme, required this.volumePrecisionController, required this.weightPrecisionController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.precision_manufacturing, color: colorScheme.secondary),
              const SizedBox(width: 12),
              Text('Instrument Precision', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: colorScheme.onSurface)),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isRow = constraints.maxWidth >= 600;
              final weightTile = _PrecisionTileWidget(
                colorScheme: colorScheme,
                title: 'Scale Calibration',
                icon: Icons.scale,
                label: 'Balance Precision (g)',
                controller: weightPrecisionController,
                unit: 'g',
              );
              final volumeTile = _PrecisionTileWidget(
                colorScheme: colorScheme,
                title: 'Liquid Volumetrics',
                icon: Icons.opacity,
                label: 'Volume Precision (L)',
                controller: volumePrecisionController,
                unit: 'L',
              );
              if (isRow) {
                return Row(
                  children: [
                    Expanded(child: weightTile),
                    const SizedBox(width: 24),
                    Expanded(child: volumeTile),
                  ],
                );
              }
              return Column(
                children: [
                  weightTile,
                  const SizedBox(height: 16),
                  volumeTile,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PrecisionTileWidget extends StatelessWidget {
  final ColorScheme colorScheme;
  final String title;
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String unit;

  const _PrecisionTileWidget({
    required this.colorScheme,
    required this.title,
    required this.icon,
    required this.label,
    required this.controller,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.05, color: colorScheme.onSurfaceVariant)),
              Icon(icon, color: colorScheme.secondaryContainer),
            ],
          ),
          const SizedBox(height: 12),
          Text(label, style: TextStyle(fontSize: 14, color: colorScheme.onSurface)),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.01, fontFamily: 'monospace'),
                ),
              ),
              const SizedBox(width: 8),
              Text(unit, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant, fontFamily: 'monospace')),
            ],
          ),
        ],
      ),
    );
  }
}

class _PreferencesCard extends StatelessWidget {
  final ColorScheme colorScheme;
  const _PreferencesCard({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: colorScheme.onSurface)),
          const SizedBox(height: 24),
          _PreferenceRow(
            colorScheme: colorScheme,
            title: 'Units of Mass',
            subtitle: 'Grams or Ounces',
            child: DropdownButton<String>(
              value: 'Metric (g)',
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'Metric (g)', child: Text('Metric (g)')),
                DropdownMenuItem(value: 'Imperial (oz)', child: Text('Imperial (oz)')),
              ],
              onChanged: (_) {},
            ),
          ),
          const SizedBox(height: 20),
          _PreferenceRow(
            colorScheme: colorScheme,
            title: 'Concentration',
            subtitle: 'Target value format',
            child: DropdownButton<String>(
              value: 'ppm',
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'ppm', child: Text('ppm')),
                DropdownMenuItem(value: 'mM', child: Text('mM')),
              ],
              onChanged: (_) {},
            ),
          ),
          const SizedBox(height: 20),
          _PreferenceRow(
            colorScheme: colorScheme,
            title: 'Appearance',
            subtitle: 'System default theme',
            child: Container(
              decoration: BoxDecoration(color: colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(999)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
                    ),
                    child: Icon(Icons.light_mode, size: 20, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(Icons.dark_mode, size: 20, color: colorScheme.onSurfaceVariant.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _PreferenceRow(
            colorScheme: colorScheme,
            title: 'Language',
            subtitle: 'App interface language',
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.expand_more, size: 18),
              label: const Text('English'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceRow extends StatelessWidget {
  final ColorScheme colorScheme;
  final String title;
  final String subtitle;
  final Widget child;
  const _PreferenceRow({required this.colorScheme, required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface)),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        child,
      ],
    );
  }
}

class _AboutCard extends StatelessWidget {
  final ColorScheme colorScheme;
  const _AboutCard({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.secondaryContainer.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT HYDROBUDDY',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.05, color: colorScheme.secondary),
          ),
          const SizedBox(height: 12),
          Text(
            'A specialized open-source tool for calculating nutrient solutions for hydroponics and general agriculture.',
            style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          _AboutLinkRow(colorScheme: colorScheme, icon: Icons.description, label: 'Documentation'),
          const SizedBox(height: 8),
          _AboutLinkRow(colorScheme: colorScheme, icon: Icons.mail, label: 'Contact Support'),
          const SizedBox(height: 20),
          Divider(height: 1, color: colorScheme.secondaryContainer.withOpacity(0.2)),
          const SizedBox(height: 16),
          Text('Version 2.4.12-stable', style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant, fontFamily: 'monospace')),
          const SizedBox(height: 4),
          Text('Built for Precision Growth', style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant, fontFamily: 'monospace')),
        ],
      ),
    );
  }
}

class _AboutLinkRow extends StatelessWidget {
  final ColorScheme colorScheme;
  final IconData icon;
  final String label;
  const _AboutLinkRow({required this.colorScheme, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(icon, size: 20, color: colorScheme.secondary),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.secondary)),
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  final ColorScheme colorScheme;
  final VoidCallback onReset;
  final VoidCallback onSave;
  const _ActionBar({required this.colorScheme, required this.onReset, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: onReset,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: BorderSide(color: colorScheme.outline),
          ),
          child: const Text('Reset to Defaults'),
        ),
        const SizedBox(width: 16),
        FilledButton(
          onPressed: onSave,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            backgroundColor: colorScheme.primary,
          ),
          child: const Text('Save All Settings'),
        ),
      ],
    );
  }
}
