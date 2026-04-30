import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';

final _noteControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());

class SnapshotTimeline extends ConsumerStatefulWidget {
  final int formulationId;

  const SnapshotTimeline({super.key, required this.formulationId});

  @override
  ConsumerState<SnapshotTimeline> createState() => _SnapshotTimelineState();
}

class _SnapshotTimelineState extends ConsumerState<SnapshotTimeline> {
  final _dayFormatter = DateFormat('dd/MM');

  @override
  Widget build(BuildContext context) {
    final formulationAsync = ref.watch(formulationByIdProvider(widget.formulationId));
    final snapshotsAsync = ref.watch(watchSnapshotsProvider(widget.formulationId));

    return formulationAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, s) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Erro: $e')),
      ),
      data: (formulation) {
        if (formulation == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Formulação não encontrada')),
            body: const Center(child: Text('Esta formulação não existe.')),
          );
        }

        final title = 'Histórico: ${formulation.name}';

        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: snapshotsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text('Erro: $e')),
            data: (snapshots) {
              if (snapshots.isEmpty) {
                return const Center(child: Text('Nenhum snapshot registrado'));
              }
              return _buildTimeline(context, snapshots);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showCreateSnapshotDialog(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildTimeline(BuildContext context, List<db.FormulationSnapshot> snapshots) {
    if (snapshots.isEmpty) {
      return const Center(child: Text('Nenhum snapshot registrado'));
    }

    String? lastDay;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      itemCount: snapshots.length,
      itemBuilder: (context, index) {
        final snapshot = snapshots[index];
        final isLatest = index == 0;
        final date = DateTime.parse(snapshot.created_at);
        final dayStr = _dayFormatter.format(date);

        final showDayHeader = lastDay != dayStr;
        lastDay = dayStr;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDayHeader)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '── $dayStr ──',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            _SnapshotTile(
              snapshot: snapshot,
              isLatest: isLatest,
              onRestore: () => _restore(context, snapshot),
            ),
          ],
        );
      },
    );
  }

  void _restore(BuildContext context, db.FormulationSnapshot snapshot) {
    try {
      final data = jsonDecode(snapshot.snapshot_data) as Map<String, dynamic>;
      final formNotifier = ref.read(formulationFormProvider.notifier);
      formNotifier.updateNutrient(
        nNo3: (data['nNo3'] as num?)?.toDouble() ?? 0.0,
        nNh4: (data['nNh4'] as num?)?.toDouble() ?? 0.0,
        p: (data['p'] as num?)?.toDouble() ?? 0.0,
        k: (data['k'] as num?)?.toDouble() ?? 0.0,
        ca: (data['ca'] as num?)?.toDouble() ?? 0.0,
        mg: (data['mg'] as num?)?.toDouble() ?? 0.0,
        s: (data['s'] as num?)?.toDouble() ?? 0.0,
        fe: (data['fe'] as num?)?.toDouble() ?? 0.0,
        mn: (data['mn'] as num?)?.toDouble() ?? 0.0,
        zn: (data['zn'] as num?)?.toDouble() ?? 0.0,
        b: (data['b'] as num?)?.toDouble() ?? 0.0,
        cu: (data['cu'] as num?)?.toDouble() ?? 0.0,
        si: (data['si'] as num?)?.toDouble() ?? 0.0,
        mo: (data['mo'] as num?)?.toDouble() ?? 0.0,
        na: (data['na'] as num?)?.toDouble() ?? 0.0,
        cl: (data['cl'] as num?)?.toDouble() ?? 0.0,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valores restaurados no editor de formulação')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao restaurar: $e')),
      );
    }
  }

  void _showCreateSnapshotDialog(BuildContext context) {
    final noteCtrl = ref.read(_noteControllerProvider);
    noteCtrl.clear();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Novo Snapshot'),
        content: TextField(
          controller: noteCtrl,
          decoration: const InputDecoration(labelText: 'Nota', hintText: 'Opcional'),
          maxLines: 3,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              final note = noteCtrl.text.trim();
              Navigator.pop(ctx);
              await _createSnapshot(note);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  Future<void> _createSnapshot(String note) async {
    final formulation = ref.read(formulationByIdProvider(widget.formulationId)).valueOrNull;
    if (formulation == null) return;
    final data = jsonEncode(formulation.toJson());
    await ref.read(createSnapshotProvider(
      formulationId: widget.formulationId,
      note: note,
      triggerType: 'manual',
      snapshotData: data,
    ).future);
  }
}

class _SnapshotTile extends StatelessWidget {
  final db.FormulationSnapshot snapshot;
  final bool isLatest;
  final VoidCallback onRestore;

  const _SnapshotTile({
    required this.snapshot,
    required this.isLatest,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(snapshot.created_at);
    final timeStr = DateFormat('HH:mm').format(date);
    final triggerLabel = _triggerLabel(snapshot.trigger_type);

    final nutrientSummary = _parseNutrientSummary(snapshot.snapshot_data);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                isLatest ? Icons.circle : Icons.circle_outlined,
                size: 14,
                color: isLatest
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              Container(
                width: 2,
                height: 80,
                color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$timeStr · $triggerLabel',
                          style: TextStyle(
                            fontWeight: isLatest ? FontWeight.w700 : FontWeight.w500,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    if (snapshot.note != null && snapshot.note!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        snapshot.note!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (nutrientSummary.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        nutrientSummary,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 28,
                      child: OutlinedButton(
                        onPressed: onRestore,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        child: const Text('Restaurar', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _triggerLabel(String type) {
    switch (type) {
      case 'manual':
        return 'manual';
      case 'auto_save':
        return 'auto save';
      case 'before_edit':
        return 'antes de editar';
      default:
        return type;
    }
  }

  String _parseNutrientSummary(String snapshotData) {
    try {
      final data = jsonDecode(snapshotData) as Map<String, dynamic>;
      final buffer = StringBuffer();
      const nutrients = [
        ('N-NO3', 'nNo3'),
        ('N-NH4', 'nNh4'),
        ('P', 'p'),
        ('K', 'k'),
        ('Ca', 'ca'),
        ('Mg', 'mg'),
        ('S', 's'),
        ('Fe', 'fe'),
        ('Mn', 'mn'),
        ('Zn', 'zn'),
        ('B', 'b'),
        ('Cu', 'cu'),
        ('Si', 'si'),
        ('Mo', 'mo'),
        ('Na', 'na'),
        ('Cl', 'cl'),
      ];
      for (final (symbol, key) in nutrients) {
        final value = data[key];
        if (value is num && value.toDouble() > 0) {
          buffer.write('$symbol: ${value.toStringAsFixed(value is double && value == value.truncateToDouble() ? 0 : 1)}, ');
        }
      }
      final result = buffer.toString();
      if (result.endsWith(', ')) {
        return result.substring(0, result.length - 2);
      }
      return result;
    } catch (_) {
      return '';
    }
  }
}
