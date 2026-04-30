import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';

class TissueScreen extends ConsumerWidget {
  const TissueScreen({super.key});

  Future<bool?> _confirmDelete(BuildContext context, WidgetRef ref, db.TissueAnalysi tissue) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir análise'),
        content: Text('Deseja excluir "${tissue.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      ref.read(deleteTissueProvider(tissue.id));
    }
    return confirmed;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tissuesAsync = ref.watch(watchTissuesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Análise de Tecido')),
      body: tissuesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (tissues) {
          if (tissues.isEmpty) {
            return const Center(
              child: Text('Nenhuma análise de tecido cadastrada'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: tissues.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final t = tissues[index];
              return Dismissible(
                key: ValueKey(t.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: (_) => _confirmDelete(context, ref, t),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Card(
                  child: ListTile(
                    title: Text(t.name),
                    subtitle: Text(
                      'N: ${t.n.toStringAsFixed(1)}%, P: ${t.p.toStringAsFixed(1)}%, K: ${t.k.toStringAsFixed(1)}%',
                    ),
                    onTap: () => context.push('/tissue/edit/${t.id}'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/tissue/new'),
        label: const Text('Nova análise'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
