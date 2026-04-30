import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';

class WaterQualityEditorScreen extends ConsumerStatefulWidget {
  final int? waterQualityId;

  const WaterQualityEditorScreen({super.key, this.waterQualityId});

  bool get isEditing => waterQualityId != null;

  @override
  ConsumerState<WaterQualityEditorScreen> createState() =>
      _WaterQualityEditorScreenState();
}

class _WaterQualityEditorScreenState
    extends ConsumerState<WaterQualityEditorScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _phCtrl;
  late final TextEditingController _ghCtrl;
  late final TextEditingController _khCtrl;
  late final Map<Element, TextEditingController> _elementCtrls;

  bool _isDefault = false;
  bool _loaded = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _phCtrl = TextEditingController();
    _ghCtrl = TextEditingController();
    _khCtrl = TextEditingController();
    _elementCtrls = {
      for (final e in Element.all) e: TextEditingController(text: '0.0'),
    };
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phCtrl.dispose();
    _ghCtrl.dispose();
    _khCtrl.dispose();
    for (final c in _elementCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _populateFrom(db.WaterQualityData q) {
    _nameCtrl.text = q.name;
    _isDefault = q.is_default;
    _phCtrl.text = q.ph?.toString() ?? '';
    _ghCtrl.text = q.gh?.toString() ?? '';
    _khCtrl.text = q.kh?.toString() ?? '';
    _elementCtrls[Element.nNo3]!.text = q.n_no3.toString();
    _elementCtrls[Element.nNh4]!.text = q.n_nh4.toString();
    _elementCtrls[Element.p]!.text = q.p.toString();
    _elementCtrls[Element.k]!.text = q.k.toString();
    _elementCtrls[Element.ca]!.text = q.ca.toString();
    _elementCtrls[Element.mg]!.text = q.mg.toString();
    _elementCtrls[Element.s]!.text = q.s.toString();
    _elementCtrls[Element.fe]!.text = q.fe.toString();
    _elementCtrls[Element.mn]!.text = q.mn.toString();
    _elementCtrls[Element.zn]!.text = q.zn.toString();
    _elementCtrls[Element.b]!.text = q.b.toString();
    _elementCtrls[Element.cu]!.text = q.cu.toString();
    _elementCtrls[Element.si]!.text = q.si.toString();
    _elementCtrls[Element.mo]!.text = q.mo.toString();
    _elementCtrls[Element.na]!.text = q.na.toString();
    _elementCtrls[Element.cl]!.text = q.cl.toString();
    _loaded = true;
  }

  Future<void> _load() async {
    if (widget.waterQualityId == null) {
      _loaded = true;
      return;
    }
    setState(() => _loading = true);
    final q =
        await ref.read(waterQualityByIdProvider(widget.waterQualityId!).future);
    if (q != null && mounted) {
      _populateFrom(q);
    }
    if (mounted) setState(() => _loading = false);
  }

  double _parseDouble(TextEditingController c) {
    return double.tryParse(c.text) ?? 0.0;
  }

  double? _parseOptionalDouble(TextEditingController c) {
    final text = c.text.trim();
    if (text.isEmpty) return null;
    return double.tryParse(text);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final companion = db.WaterQualityCompanion(
      id: widget.waterQualityId != null
          ? Value(widget.waterQualityId!)
          : const Value.absent(),
      name: Value(_nameCtrl.text.trim()),
      is_default: Value(_isDefault),
      ph: Value(_parseOptionalDouble(_phCtrl)),
      gh: Value(_parseOptionalDouble(_ghCtrl)),
      kh: Value(_parseOptionalDouble(_khCtrl)),
      n_no3: Value(_parseDouble(_elementCtrls[Element.nNo3]!)),
      n_nh4: Value(_parseDouble(_elementCtrls[Element.nNh4]!)),
      p: Value(_parseDouble(_elementCtrls[Element.p]!)),
      k: Value(_parseDouble(_elementCtrls[Element.k]!)),
      ca: Value(_parseDouble(_elementCtrls[Element.ca]!)),
      mg: Value(_parseDouble(_elementCtrls[Element.mg]!)),
      s: Value(_parseDouble(_elementCtrls[Element.s]!)),
      fe: Value(_parseDouble(_elementCtrls[Element.fe]!)),
      mn: Value(_parseDouble(_elementCtrls[Element.mn]!)),
      zn: Value(_parseDouble(_elementCtrls[Element.zn]!)),
      b: Value(_parseDouble(_elementCtrls[Element.b]!)),
      cu: Value(_parseDouble(_elementCtrls[Element.cu]!)),
      si: Value(_parseDouble(_elementCtrls[Element.si]!)),
      mo: Value(_parseDouble(_elementCtrls[Element.mo]!)),
      na: Value(_parseDouble(_elementCtrls[Element.na]!)),
      cl: Value(_parseDouble(_elementCtrls[Element.cl]!)),
    );

    final notifier = ref.read(waterQualityFormProvider.notifier);
    if (widget.isEditing) {
      await notifier.updateWaterQuality(companion);
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
        appBar: AppBar(title: const Text('Carregando...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? 'Editar Perfil' : 'Novo Perfil',
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
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nome obrigatório' : null,
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                title: const Text('Padrão (default)'),
                value: _isDefault,
                onChanged: (v) => setState(() => _isDefault = v ?? false),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phCtrl,
                decoration: const InputDecoration(
                  labelText: 'pH',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ghCtrl,
                decoration: const InputDecoration(
                  labelText: 'GH',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _khCtrl,
                decoration: const InputDecoration(
                  labelText: 'KH',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              Text('Composição (ppm)',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              _buildElementGrid(),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Salvar'),
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
