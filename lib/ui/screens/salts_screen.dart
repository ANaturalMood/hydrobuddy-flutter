import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';

class SaltsScreen extends ConsumerStatefulWidget {
  const SaltsScreen({super.key});

  @override
  ConsumerState<SaltsScreen> createState() => _SaltsScreenState();
}

class _SaltsScreenState extends ConsumerState<SaltsScreen> {
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
    final substancesAsync = _query.isEmpty
        ? ref.watch(watchSubstancesProvider)
        : ref.watch(searchSubstancesProvider(_query));

    return Scaffold(
      body: Stack(
        children: [
          substancesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Erro: $err')),
            data: (substances) => SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 80,
                bottom: 100,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SearchSection(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                  ),
                  const SizedBox(height: 16),
                  _HeaderSection(totalCount: substances.length),
                  const SizedBox(height: 20),
                  _CardGrid(substances: substances),
                  const SizedBox(height: 32),
                  _DecorativeSection(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  bottom: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.science, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'HydroBuddy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications_outlined,
                        color: colorScheme.onSurfaceVariant),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              color: Colors.transparent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24, bottom: 8),
              child: FloatingActionButton(
                heroTag: 'addSaltFab',
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                onPressed: () => context.push('/salts/new'),
                tooltip: 'Add New Salt',
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

  const _SearchSection({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.search, color: Colors.grey),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search salts by name or formula...',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.tune),
              color: Colors.grey[500],
              onPressed: () {},
              splashRadius: 20,
            ),
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
            Text(
              'Salts Library',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.01,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Manage mineral substances and nutrient compositions.',
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total Substances',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.05,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '$totalCount',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.02,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CardGrid extends StatelessWidget {
  final List<Substance> substances;

  const _CardGrid({required this.substances});

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
          itemCount: substances.length,
          itemBuilder: (context, index) =>
              _SaltCard(substance: substances[index], index: index),
        );
      },
    );
  }
}

class _SaltCard extends StatelessWidget {
  final Substance substance;
  final int index;

  const _SaltCard({required this.substance, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final topElements = _topElements(substance);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _iconContainerColor(index),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.science,
                      color: _iconTextColor(index),
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        substance.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (substance.formula != null)
                        Text(
                          substance.formula!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.01,
                            color: colorScheme.secondary,
                            fontFamily: 'monospace',
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 36,
                  height: 36,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.edit, color: colorScheme.outline, size: 20),
                    onPressed: () =>
                        context.push('/salts/edit/${substance.id}'),
                    splashRadius: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final entry in topElements)
                  Expanded(
                    child: _StatBox(
                      label: '${entry.$1.displayName} (${entry.$1.symbol})',
                      value: entry.$2,
                      isPurity: false,
                    ),
                  ),
                if (topElements.length < 2)
                  for (int i = topElements.length; i < 2; i++)
                    const Expanded(child: SizedBox()),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatBox(
                    label: 'Purity',
                    value: substance.purity * 100,
                    isPurity: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey[100]),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.payments, size: 16, color: colorScheme.outline),
                    const SizedBox(width: 4),
                    Text(
                      'Cost per kg: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      '\$${substance.cost.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (substance.source != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _badgeColor(substance),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      substance.source!,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _badgeTextColor(substance),
                        letterSpacing: 0.05,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<(Element, double)> _topElements(Substance s) {
    final elements = <(Element, double)>[];
    for (final e in Element.all) {
      final val = s.getN(e);
      if (val > 0) elements.add((e, val));
    }
    elements.sort((a, b) => b.$2.compareTo(a.$2));
    return elements.take(2).toList();
  }

  Color _iconContainerColor(int index) {
    const colors = [
      Color(0xFFD6E3FF),
      Color(0xFFA3F69C),
      Color(0xFFCFE6F2),
      Color(0xFFFFE0B2),
    ];
    return colors[index % colors.length];
  }

  Color _iconTextColor(int index) {
    const colors = [
      Color(0xFF001B3D),
      Color(0xFF002204),
      Color(0xFF071E27),
      Color(0xFF3E1A00),
    ];
    return colors[index % colors.length];
  }

  Color _badgeColor(Substance s) {
    final src = s.source?.toLowerCase() ?? '';
    if (src.contains('nitrate')) return const Color(0xFFD6E3FF);
    if (src.contains('phosphate') || src.contains('bloom')) return const Color(0xFFFFE0B2);
    if (src.contains('epsom') || src.contains('magnesium')) return const Color(0xFFE0E0E0);
    return const Color(0xFFD6E3FF);
  }

  Color _badgeTextColor(Substance s) {
    final src = s.source?.toLowerCase() ?? '';
    if (src.contains('nitrate')) return const Color(0xFF001B3D);
    if (src.contains('phosphate') || src.contains('bloom')) return const Color(0xFF3E1A00);
    if (src.contains('epsom') || src.contains('magnesium')) return const Color(0xFF1A1A1A);
    return const Color(0xFF001B3D);
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final double value;
  final bool isPurity;

  const _StatBox({
    required this.label,
    required this.value,
    required this.isPurity,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.surfaceVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.05,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${value.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.01,
              color: isPurity ? colorScheme.secondary : colorScheme.primary,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 768;
        return Row(
          children: [
            _DecorativeTile(
              label: 'Chemical Purity',
              color: const Color(0xFF2E7D32).withOpacity(0.1),
              textColor: Colors.white,
            ),
            if (isDesktop) const SizedBox(width: 20),
            if (!isDesktop) const SizedBox(height: 12),
            _DecorativeTile(
              label: 'Precision Mix',
              color: const Color(0xFF005DB7).withOpacity(0.1),
              textColor: Colors.white,
            ),
            if (isDesktop) const SizedBox(width: 20),
            if (!isDesktop) const SizedBox(height: 12),
            _DecorativeTile(
              label: 'Healthy Growth',
              color: const Color(0xFF2E7D32).withOpacity(0.1),
              textColor: Colors.white,
            ),
          ],
        );
      },
    );
  }
}

class _DecorativeTile extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;

  const _DecorativeTile({
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 128,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
