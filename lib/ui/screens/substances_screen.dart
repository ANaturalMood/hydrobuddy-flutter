import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/ui/widgets/substance_list.dart';

/// Tela de listagem de substancias com busca e FAB para adicionar.
class SubstancesScreen extends ConsumerStatefulWidget {
  const SubstancesScreen({super.key});

  @override
  ConsumerState<SubstancesScreen> createState() => _SubstancesScreenState();
}

class _SubstancesScreenState extends ConsumerState<SubstancesScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() => _query = value);
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final substancesAsync = _query.isEmpty
        ? ref.watch(watchSubstancesProvider)
        : ref.watch(searchSubstancesProvider(_query));

    return Scaffold(
      appBar: AppBar(title: const Text('Substancias')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Buscar substancia...',
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
            child: substancesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Erro: $err')),
              data: (substances) => SubstanceListView(
                substances: substances,
                onTap: (substance) =>
                    context.push('/substances/edit/${substance.id}'),
                onDelete: (substance) {
                  ref.read(deleteSubstanceProvider(substance.id));
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/substances/new'),
        label: const Text('Adicionar substancia'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
