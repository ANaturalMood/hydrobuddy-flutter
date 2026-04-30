import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';

class TissueScreen extends ConsumerWidget {
  const TissueScreen({super.key});

  Future<bool?> _confirmDelete(BuildContext context, WidgetRef ref, db.TissueAnalysi tissue) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.deleteAnalysis),
        content: Text(AppLocalizations.of(context)!.confirmDeleteTissue(tissue.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(AppLocalizations.of(context)!.delete),
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.tissueAnalysis)),
      body: tissuesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (tissues) {
          if (tissues.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.noTissueAnalysis),
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
        label: Text(AppLocalizations.of(context)!.newAnalysis),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
