import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';

class WaterQualityScreen extends ConsumerStatefulWidget {
  const WaterQualityScreen({super.key});

  @override
  ConsumerState<WaterQualityScreen> createState() => _WaterQualityScreenState();
}

class _WaterQualityScreenState extends ConsumerState<WaterQualityScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() => _query = value.trim().toLowerCase());
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  Future<bool?> _confirmDelete(db.WaterQualityData quality) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir perfil'),
        content: Text('Deseja excluir "${quality.name}"?'),
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
      ref.read(deleteWaterQualityProvider(quality.id));
    }
    return confirmed;
  }

  @override
  Widget build(BuildContext context) {
    final qualitiesAsync = ref.watch(watchWaterQualitiesProvider);

    final filtered = _query.isEmpty
        ? qualitiesAsync
        : qualitiesAsync.whenData(
            (list) => list
                .where((q) => q.name.toLowerCase().contains(_query))
                .toList(),
          );

    return Scaffold(
      appBar: AppBar(title: const Text('Qualidade da Água')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Buscar perfil...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearSearch,
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filtered.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Erro: $err')),
              data: (qualities) {
                if (qualities.isEmpty) {
                  return const Center(
                    child: Text('Nenhum perfil de água cadastrado'),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: qualities.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final q = qualities[index];
                    return Dismissible(
                      key: ValueKey(q.id),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (_) => _confirmDelete(q),
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  q.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (q.is_default)
                                const Chip(
                                  label: Text(
                                    'Padrão',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  visualDensity: VisualDensity.compact,
                                ),
                            ],
                          ),
                          subtitle: Text(
                            [
                              if (q.ph != null) 'pH ${q.ph!.toStringAsFixed(1)}',
                              if (q.gh != null) 'GH ${q.gh!.toStringAsFixed(1)}',
                              if (q.kh != null) 'KH ${q.kh!.toStringAsFixed(1)}',
                            ].join(' | ').isEmpty
                                ? 'Sem parâmetros adicionais'
                                : [
                                    if (q.ph != null)
                                      'pH ${q.ph!.toStringAsFixed(1)}',
                                    if (q.gh != null)
                                      'GH ${q.gh!.toStringAsFixed(1)}',
                                    if (q.kh != null)
                                      'KH ${q.kh!.toStringAsFixed(1)}',
                                  ].join(' | '),
                          ),
                          onTap: () =>
                              context.push('/water-quality/edit/${q.id}'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/water-quality/new'),
        label: const Text('Novo perfil'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
