import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';

const _concTypes = ['w/w', 'w/v', 'v/v', 'Outro'];

/// Tela de criacao/edicao de substancia.
class SubstanceEditorScreen extends ConsumerStatefulWidget {
  final int? substanceId;

  const SubstanceEditorScreen({super.key, this.substanceId});

  bool get isEditing => substanceId != null;

  @override
  ConsumerState<SubstanceEditorScreen> createState() =>
      _SubstanceEditorScreenState();
}

class _SubstanceEditorScreenState extends ConsumerState<SubstanceEditorScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _formulaCtrl;
  late final TextEditingController _sourceCtrl;
  late final TextEditingController _purityCtrl;
  late final TextEditingController _costCtrl;
  late final TextEditingController _densityCtrl;
  late final Map<Element, TextEditingController> _elementCtrls;

  bool _isLiquid = false;
  String _concType = 'w/w';

  bool _loaded = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _formulaCtrl = TextEditingController();
    _sourceCtrl = TextEditingController();
    _purityCtrl = TextEditingController(text: '1.0');
    _costCtrl = TextEditingController(text: '0.0');
    _densityCtrl = TextEditingController(text: '1.0');
    _elementCtrls = {
      for (final e in Element.all)
        e: TextEditingController(text: '0.0'),
    };
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _formulaCtrl.dispose();
    _sourceCtrl.dispose();
    _purityCtrl.dispose();
    _costCtrl.dispose();
    _densityCtrl.dispose();
    for (final c in _elementCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _populateFrom(Substance s) {
    _nameCtrl.text = s.name;
    _formulaCtrl.text = s.formula ?? '';
    _sourceCtrl.text = s.source ?? '';
    _purityCtrl.text = s.purity.toString();
    _costCtrl.text = s.cost.toString();
    _isLiquid = s.isLiquid;
    _densityCtrl.text = s.density.toString();
    _concType = s.concType ?? 'w/w';
    if (s.concType != null && !_concTypes.contains(s.concType)) {
      _concType = 'Outro';
    }
    for (final e in Element.all) {
      _elementCtrls[e]!.text = s.getN(e).toString();
    }
    _loaded = true;
  }

  Future<void> _load() async {
    if (widget.substanceId == null) {
      _loaded = true;
      return;
    }
    setState(() => _loading = true);
    final s = await ref.read(substanceByIdProvider(widget.substanceId!).future);
    if (s != null && mounted) {
      _populateFrom(s);
    }
    if (mounted) setState(() => _loading = false);
  }

  double _parseDouble(TextEditingController c) {
    return double.tryParse(c.text) ?? 0.0;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final substance = Substance(
      id: widget.substanceId ?? -1,
      name: _nameCtrl.text.trim(),
      formula: _formulaCtrl.text.trim().isEmpty
          ? null
          : _formulaCtrl.text.trim(),
      source: _sourceCtrl.text.trim().isEmpty
          ? null
          : _sourceCtrl.text.trim(),
      purity: _parseDouble(_purityCtrl),
      cost: _parseDouble(_costCtrl),
      isLiquid: _isLiquid,
      density: _parseDouble(_densityCtrl),
      concType: _concType == 'Outro' ? null : _concType,
      nNo3: _parseDouble(_elementCtrls[Element.nNo3]!),
      nNh4: _parseDouble(_elementCtrls[Element.nNh4]!),
      p: _parseDouble(_elementCtrls[Element.p]!),
      k: _parseDouble(_elementCtrls[Element.k]!),
      ca: _parseDouble(_elementCtrls[Element.ca]!),
      mg: _parseDouble(_elementCtrls[Element.mg]!),
      s: _parseDouble(_elementCtrls[Element.s]!),
      fe: _parseDouble(_elementCtrls[Element.fe]!),
      mn: _parseDouble(_elementCtrls[Element.mn]!),
      zn: _parseDouble(_elementCtrls[Element.zn]!),
      b: _parseDouble(_elementCtrls[Element.b]!),
      cu: _parseDouble(_elementCtrls[Element.cu]!),
      si: _parseDouble(_elementCtrls[Element.si]!),
      mo: _parseDouble(_elementCtrls[Element.mo]!),
      na: _parseDouble(_elementCtrls[Element.na]!),
      cl: _parseDouble(_elementCtrls[Element.cl]!),
    );

    final notifier = ref.read(substanceFormProvider.notifier);
    if (widget.isEditing) {
      await notifier.updateSubstance(substance);
    } else {
      await notifier.create(substance);
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
          widget.isEditing ? AppLocalizations.of(context)!.editSubstance : AppLocalizations.of(context)!.newSubstance,
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
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                    (v == null || v.trim().isEmpty) ? AppLocalizations.of(context)!.nameRequired : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _formulaCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.formula,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _sourceCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.source,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _purityCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.purity,
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null) return AppLocalizations.of(context)!.invalidNumber;
                if (n < 0.0 || n > 1.0) return AppLocalizations.of(context)!.valueBetween;
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _costCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.costPerKg,
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.liquid),
              value: _isLiquid,
              onChanged: (v) => setState(() => _isLiquid = v),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _densityCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.density,
                border: const OutlineInputBorder(),
                enabled: _isLiquid,
                hintText: _isLiquid ? null : AppLocalizations.of(context)!.onlyForLiquids,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              enabled: _isLiquid,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _concType,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.concentrationType,
                border: OutlineInputBorder(),
              ),
              items: _concTypes
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (v) => setState(() => _concType = v ?? 'w/w'),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.elementalComposition,
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
    final elements = Element.all;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
      ),
      itemCount: elements.length,
      itemBuilder: (context, index) {
        final e = elements[index];
        return TextFormField(
          controller: _elementCtrls[e]!,
          decoration: InputDecoration(
            labelText: e.symbol,
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
