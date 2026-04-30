import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';

class RecipesScreen extends ConsumerStatefulWidget {
  const RecipesScreen({super.key});

  @override
  ConsumerState<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends ConsumerState<RecipesScreen> {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formulationsAsync = ref.watch(watchFormulationsProvider);

    return Scaffold(
      body: Stack(
        children: [
          formulationsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Erro: $err')),
            data: (formulations) {
              final filtered = _query.isEmpty
                  ? formulations
                  : formulations.where((f) =>
                      f.name.toLowerCase().contains(_query.toLowerCase())).toList();
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 80, bottom: 100, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchSection(controller: _searchController, onChanged: _onSearchChanged),
                    const SizedBox(height: 16),
                    _HeaderSection(totalCount: filtered.length),
                    const SizedBox(height: 20),
                    _CardGrid(formulations: filtered),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
              ),
              child: Row(
                children: [
                  Icon(Icons.science, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('HydroBuddy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.primary)),
                  const Spacer(),
                  IconButton(icon: Icon(Icons.notifications_outlined, color: colorScheme.onSurfaceVariant), onPressed: () {}),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text('JD', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorScheme.onPrimaryContainer)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              height: 80,
              color: Colors.transparent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24, bottom: 8),
              child: FloatingActionButton(
                heroTag: 'addRecipeFab',
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                onPressed: () => context.push('/recipes/new'),
                tooltip: 'Create Recipe',
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const _SearchSection({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
      ),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 16), child: Icon(Icons.search, color: Colors.grey)),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search recipes by name...',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(icon: const Icon(Icons.tune), color: Colors.grey[500], onPressed: () {}, splashRadius: 20),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final int totalCount;
  const _HeaderSection({required this.totalCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipes Library', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.01, color: colorScheme.onSurface)),
            const SizedBox(height: 2),
            Text('Manage saved nutrient formulations.', style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Total Formulations', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.05, color: colorScheme.onSurfaceVariant)),
            Text('$totalCount', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -0.02, color: colorScheme.primary)),
          ],
        ),
      ],
    );
  }
}

class _CardGrid extends StatelessWidget {
  final List<Formulation> formulations;
  const _CardGrid({required this.formulations});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop ? 2 : 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: isDesktop ? 1.8 : 1.6,
          ),
          itemCount: formulations.length,
          itemBuilder: (context, index) => _RecipeCard(formulation: formulations[index], index: index),
        );
      },
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final Formulation formulation;
  final int index;
  const _RecipeCard({required this.formulation, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final totalN = formulation.nNo3 + formulation.nNh4;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: _iconColor(index), borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Icon(Icons.menu_book, color: _iconTextColor(index), size: 20)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formulation.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text(
                        '${_formatDate(formulation.createdAt)} \u2022 ${formulation.concUnit}',
                        style: TextStyle(fontSize: 13, color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 36, height: 36,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.edit, color: colorScheme.outline, size: 20),
                    onPressed: () => context.push('/recipes/edit/${formulation.id}'),
                    splashRadius: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _NutrientBox(label: 'N', value: totalN, colorScheme: colorScheme),
                const SizedBox(width: 8),
                _NutrientBox(label: 'P', value: formulation.p, colorScheme: colorScheme),
                const SizedBox(width: 8),
                _NutrientBox(label: 'K', value: formulation.k, colorScheme: colorScheme),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey[100]),
            const SizedBox(height: 12),
            if (formulation.description != null && formulation.description!.isNotEmpty)
              Text(
                formulation.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: colorScheme.onSurfaceVariant),
              )
            else
              Text(
                'No description',
                style: TextStyle(fontSize: 13, color: colorScheme.onSurfaceVariant.withOpacity(0.6)),
              ),
          ],
        ),
      ),
    );
  }

  Color _iconColor(int index) {
    const colors = [Color(0xFFD6E3FF), Color(0xFFA3F69C), Color(0xFFCFE6F2), Color(0xFFFFE0B2)];
    return colors[index % colors.length];
  }

  Color _iconTextColor(int index) {
    const colors = [Color(0xFF001B3D), Color(0xFF002204), Color(0xFF071E27), Color(0xFF3E1A00)];
    return colors[index % colors.length];
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }
}

class _NutrientBox extends StatelessWidget {
  final String label;
  final double value;
  final ColorScheme colorScheme;
  const _NutrientBox({required this.label, required this.value, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colorScheme.surfaceVariant.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorScheme.onSurfaceVariant, letterSpacing: 0.05)),
            const SizedBox(height: 2),
            Text(
              '${value.toStringAsFixed(1)} ppm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.01, color: colorScheme.primary, fontFamily: 'monospace'),
            ),
          ],
        ),
      ),
    );
  }
}
