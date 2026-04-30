import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';

class TissueEditorScreen extends ConsumerStatefulWidget {
  final int? tissueId;

  const TissueEditorScreen({super.key, this.tissueId});

  bool get isEditing => tissueId != null;

  @override
  ConsumerState<TissueEditorScreen> createState() =>
      _TissueEditorScreenState();
}

class _TissueEditorScreenState extends ConsumerState<TissueEditorScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final Map<String, TextEditingController> _elementCtrls;

  bool _loaded = false;
  bool _loading = false;

  static const _labels = [
    'N',
    'P',
    'K',
    'Ca',
    'Mg',
    'S',
    'Fe',
    'Mn',
    'Zn',
    'B',
    'Cu',
    'Si',
    'Mo',
    'Na',
    'Cl',
  ];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _elementCtrls = {for (final l in _labels) l: TextEditingController(text: '0.0')};
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    for (final c in _elementCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _populateFrom(db.TissueAnalysi t) {
    _nameCtrl.text = t.name;
    _elementCtrls['N']!.text = t.n.toString();
    _elementCtrls['P']!.text = t.p.toString();
    _elementCtrls['K']!.text = t.k.toString();
    _elementCtrls['Ca']!.text = t.ca.toString();
    _elementCtrls['Mg']!.text = t.mg.toString();
    _elementCtrls['S']!.text = t.s.toString();
    _elementCtrls['Fe']!.text = t.fe.toString();
    _elementCtrls['Mn']!.text = t.mn.toString();
    _elementCtrls['Zn']!.text = t.zn.toString();
    _elementCtrls['B']!.text = t.b.toString();
    _elementCtrls['Cu']!.text = t.cu.toString();
    _elementCtrls['Si']!.text = t.si.toString();
    _elementCtrls['Mo']!.text = t.mo.toString();
    _elementCtrls['Na']!.text = t.na.toString();
    _elementCtrls['Cl']!.text = t.cl.toString();
    _loaded = true;
  }

  Future<void> _load() async {
    if (widget.tissueId == null) {
      _loaded = true;
      return;
    }
    setState(() => _loading = true);
    final t = await ref.read(tissueByIdProvider(widget.tissueId!).future);
    if (t != null && mounted) {
      _populateFrom(t);
    }
    if (mounted) setState(() => _loading = false);
  }

  double _parseDouble(TextEditingController c) {
    return double.tryParse(c.text) ?? 0.0;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final companion = db.TissueAnalysisCompanion(
      id: widget.tissueId != null
          ? Value(widget.tissueId!)
          : const Value.absent(),
      name: Value(_nameCtrl.text.trim()),
      n: Value(_parseDouble(_elementCtrls['N']!)),
      p: Value(_parseDouble(_elementCtrls['P']!)),
      k: Value(_parseDouble(_elementCtrls['K']!)),
      ca: Value(_parseDouble(_elementCtrls['Ca']!)),
      mg: Value(_parseDouble(_elementCtrls['Mg']!)),
      s: Value(_parseDouble(_elementCtrls['S']!)),
      fe: Value(_parseDouble(_elementCtrls['Fe']!)),
      mn: Value(_parseDouble(_elementCtrls['Mn']!)),
      zn: Value(_parseDouble(_elementCtrls['Zn']!)),
      b: Value(_parseDouble(_elementCtrls['B']!)),
      cu: Value(_parseDouble(_elementCtrls['Cu']!)),
      si: Value(_parseDouble(_elementCtrls['Si']!)),
      mo: Value(_parseDouble(_elementCtrls['Mo']!)),
      na: Value(_parseDouble(_elementCtrls['Na']!)),
      cl: Value(_parseDouble(_elementCtrls['Cl']!)),
    );

    final notifier = ref.read(tissueFormProvider.notifier);
    if (widget.isEditing) {
      await notifier.updateTissue(companion);
    } else {
      await notifier.create(companion);
    }

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded && widget.isEditing) {
      _load();
    }

    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.loading)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? AppLocalizations.of(context)!.editAnalysis : AppLocalizations.of(context)!.newAnalysis,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.name,
                  border: const OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? AppLocalizations.of(context)!.nameRequired : null,
              ),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.compositionPercent,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              _buildElementGrid(),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: Text(AppLocalizations.of(context)!.save),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildElementGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
      ),
      itemCount: _labels.length,
      itemBuilder: (context, index) {
        final label = _labels[index];
        return TextFormField(
          controller: _elementCtrls[label]!,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
        );
      },
    );
  }
}
