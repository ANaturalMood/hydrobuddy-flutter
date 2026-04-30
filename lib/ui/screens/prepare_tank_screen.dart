import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/ui/providers/tank_provider.dart';
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';

class PrepareTankScreen extends ConsumerStatefulWidget {
  const PrepareTankScreen({super.key});

  @override
  ConsumerState<PrepareTankScreen> createState() => _PrepareTankScreenState();
}

class _PrepareTankScreenState extends ConsumerState<PrepareTankScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int? _selectedFormulationId;
  double _volume = 100;
  double? _ecReal;
  double? _phReal;
  String? _notes;

  @override
  Widget build(BuildContext context) {
    final formulationsAsync = ref.watch(watchFormulationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Preparar Tanque')),
      body: formulationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (formulations) => _buildForm(context, formulations),
      ),
    );
  }

  Widget _buildForm(BuildContext context, List<Formulation> formulations) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            initialValue: _name,
            decoration: const InputDecoration(
              labelText: 'Nome',
              hintText: 'ex: Tomate Semana 3',
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
            onChanged: (v) => _name = v.trim(),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: _selectedFormulationId,
            decoration: const InputDecoration(labelText: 'Formulação'),
            items: [
              const DropdownMenuItem<int>(
                value: null,
                child: Text('Selecione...'),
              ),
              ...formulations.map(
                (f) => DropdownMenuItem<int>(
                  value: f.id,
                  child: Text(f.name),
                ),
              ),
            ],
            validator: (v) => v == null ? 'Selecione uma formulação' : null,
            onChanged: (v) =>
                setState(() => _selectedFormulationId = v),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _volume.toString(),
            decoration: const InputDecoration(
              labelText: 'Volume',
              suffixText: 'L',
            ),
            keyboardType: TextInputType.number,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Informe o volume';
              final parsed = double.tryParse(v);
              if (parsed == null || parsed <= 0) return 'Volume inválido';
              return null;
            },
            onChanged: (v) =>
                _volume = double.tryParse(v) ?? 0,
          ),
          const SizedBox(height: 16),
          _RecipeSummary(),
          const SizedBox(height: 16),
          const Text('Medições (opcional)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'EC real',
                    suffixText: 'mS/cm',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      _ecReal = double.tryParse(v),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'pH real'),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      _phReal = double.tryParse(v),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nota',
              hintText: 'Observações...',
            ),
            maxLines: 2,
            onChanged: (v) => _notes = v.isNotEmpty ? v : null,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.check),
            label: const Text('Registrar Preparo'),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(tankBatchFormProvider.notifier);
    notifier.setName(_name);
    notifier.setFormulationId(_selectedFormulationId!);
    notifier.setVolume(_volume);
    notifier.setVolumeRemaining(_volume);
    notifier.setNotes(_notes);

    await notifier.save();

    if (mounted) context.pop();
  }
}

class _RecipeSummary extends StatelessWidget {
  const _RecipeSummary();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumo da Receita',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: cs.primary,
                )),
            const SizedBox(height: 8),
            Text('KNO3: --g    MgSO4: --g    Ca(NO3)2: --g',
                style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
            Text('KH2PO4: --g    Micros: --g',
                style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
            const Divider(height: 20),
            Text('EC previsto: -- mS/cm    Custo: --/L',
                style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
