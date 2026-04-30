import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:hydrobuddy/ui/providers/formulations_provider.dart';
import 'package:hydrobuddy/domain/models/formulation.dart';

final _nameControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());

class FormulationHistoryScreen extends ConsumerWidget {
  const FormulationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formulationsAsync = ref.watch(watchFormulationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Formulações')),
      body: formulationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erro: $error')),
        data: (formulations) {
          if (formulations.isEmpty) {
            return const Center(child: Text('Nenhuma formulação cadastrada'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: formulations.length,
            itemBuilder: (context, index) {
              final f = formulations[index];
              return _FormulationCard(
                formulation: f,
                onTap: () => context.go('/formulations/${f.id}/snapshots'),
                onDelete: () => _confirmDelete(context, ref, f),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = ref.read(_nameControllerProvider);
    nameCtrl.clear();
    final unitCtrl = TextEditingController(text: 'ppm');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nova Formulação'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nome'),
              autofocus: true,
            ),
            TextField(
              controller: unitCtrl,
              decoration: const InputDecoration(labelText: 'Unidade'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              final unit = unitCtrl.text.trim();
              final formNotifier = ref.read(formulationFormProvider.notifier);
              formNotifier.loadNew(name: name, concUnit: unit.isEmpty ? 'ppm' : unit);
              final saved = await formNotifier.save();
              if (ctx.mounted) Navigator.pop(ctx);
              if (context.mounted) {
                context.go('/formulations/${saved.id}/snapshots');
              }
            },
            child: const Text('Criar'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Formulation f) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir Formulação'),
        content: Text('Deseja excluir "${f.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              await ref.read(deleteFormulationProvider(f.id).future);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}

class _FormulationCard extends StatelessWidget {
  final Formulation formulation;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _FormulationCard({
    required this.formulation,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final f = formulation;
    final dateStr = DateFormat('dd/MM HH:mm').format(f.updatedAt);

    return Dismissible(
      key: Key('formulation_${f.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      confirmDismiss: (direction) async {
        onDelete();
        return false;
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ListTile(
          title: Text(f.name, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(
            '$dateStr | ${f.concUnit}',
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}
