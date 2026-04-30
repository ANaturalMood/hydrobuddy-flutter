import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';

class SubstanceSelectionSheet extends ConsumerStatefulWidget {
  const SubstanceSelectionSheet({super.key});

  @override
  ConsumerState<SubstanceSelectionSheet> createState() =>
      _SubstanceSelectionSheetState();
}

class _SubstanceSelectionSheetState
    extends ConsumerState<SubstanceSelectionSheet> {
  late List<int> _usedIds;
  int? _selectedAvailable;
  int? _selectedUsed;

  @override
  void initState() {
    super.initState();
    _usedIds = List<int>.from(ref.read(selectedSubstanceIdsProvider));
  }

  @override
  Widget build(BuildContext context) {
    final allSubstancesAsync = ref.watch(watchSubstancesProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
          child: Row(
            children: [
              Text(
                'Substance Selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Flexible(
          child: allSubstancesAsync.when(
            data: (allSubstances) => _buildContent(allSubstances),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) =>
                Center(child: Text('Error loading substances: $e')),
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(_usedIds),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(_usedIds),
                child: const Text('Apply'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(List<Substance> allSubstances) {
    final availableSubstances =
        allSubstances.where((s) => !_usedIds.contains(s.id)).toList();
    final usedSubstances =
        allSubstances.where((s) => _usedIds.contains(s.id)).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final listHeight = (constraints.maxHeight - 120).clamp(120.0, 400.0);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: listHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _buildListPanel(
                        title: 'Available',
                        substances: availableSubstances,
                        selectedId: _selectedAvailable,
                        onSelect: (id) =>
                            setState(() => _selectedAvailable = id),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildListPanel(
                        title: 'Used',
                        substances: usedSubstances,
                        selectedId: _selectedUsed,
                        onSelect: (id) =>
                            setState(() => _selectedUsed = id),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed:
                        _selectedAvailable != null ? _addToUsed : null,
                    child: const Text('Add >>'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed:
                        _selectedUsed != null ? _removeFromUsed : null,
                    child: const Text('<< Remove'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 2,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.scale, size: 16),
                    label: const Text('Set Amount'),
                    onPressed: _selectedUsed != null ? _setAmount : null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('Reset Amounts'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.add_circle_outline, size: 16),
                    label: const Text('Add New'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Edit'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_forever_outlined,
                        size: 16),
                    label: const Text('Delete f/DB'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.save_outlined, size: 16),
                    label: const Text('Save List'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.folder_open_outlined, size: 16),
                    label: const Text('Load List'),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_sweep_outlined, size: 16),
                    label: const Text('Remove All'),
                    onPressed: _usedIds.isNotEmpty
                        ? () => setState(() {
                              _usedIds.clear();
                              _selectedAvailable = null;
                              _selectedUsed = null;
                            })
                        : null,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListPanel({
    required String title,
    required List<Substance> substances,
    required int? selectedId,
    required ValueChanged<int> onSelect,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12)),
            ),
            child: Text(
              '$title (${substances.length})',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: substances.isEmpty
                ? const Center(
                    child: Text('Empty',
                        style: TextStyle(color: Colors.grey)),
                  )
                : ListView.builder(
                    itemCount: substances.length,
                    itemBuilder: (context, index) {
                      final sub = substances[index];
                      final isSelected = sub.id == selectedId;
                      return ListTile(
                        dense: true,
                        selected: isSelected,
                        title: Text(
                          sub.name,
                          style: const TextStyle(fontSize: 13),
                        ),
                        subtitle: sub.formula != null
                            ? Text(sub.formula!,
                                style: const TextStyle(fontSize: 11))
                            : null,
                        onTap: () => onSelect(sub.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _addToUsed() {
    if (_selectedAvailable != null &&
        !_usedIds.contains(_selectedAvailable)) {
      setState(() {
        _usedIds.add(_selectedAvailable!);
        _selectedAvailable = null;
        _selectedUsed = _usedIds.last;
      });
    }
  }

  void _removeFromUsed() {
    if (_selectedUsed != null) {
      setState(() {
        _usedIds.remove(_selectedUsed);
        final idToSelect = _selectedUsed;
        _selectedUsed = null;
        _selectedAvailable = idToSelect;
      });
    }
  }

  void _setAmount() {
    if (_selectedUsed == null) return;
    showDialog(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Set Amount'),
          content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(labelText: 'Weight (g)'),
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
