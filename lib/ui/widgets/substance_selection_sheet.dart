import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
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
                AppLocalizations.of(context)!.substanceSelection,
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
                Center(child: Text(AppLocalizations.of(context)!.errorLoadingSubstances('$e'))),
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
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(_usedIds),
                child: Text(AppLocalizations.of(context)!.apply),
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
                    child: Text(AppLocalizations.of(context)!.addArrow),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed:
                        _selectedUsed != null ? _removeFromUsed : null,
                    child: Text(AppLocalizations.of(context)!.removeArrow),
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
                    label: Text(AppLocalizations.of(context)!.setAmount),
                    onPressed: _selectedUsed != null ? _setAmount : null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.refresh, size: 16),
                    label: Text(AppLocalizations.of(context)!.resetAmounts),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.add_circle_outline, size: 16),
                    label: Text(AppLocalizations.of(context)!.addNew),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: Text(AppLocalizations.of(context)!.edit),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_forever_outlined,
                        size: 16),
                    label: Text(AppLocalizations.of(context)!.deleteFromDb),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.save_outlined, size: 16),
                    label: Text(AppLocalizations.of(context)!.saveList),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.folder_open_outlined, size: 16),
                    label: Text(AppLocalizations.of(context)!.loadList),
                    onPressed: null,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_sweep_outlined, size: 16),
                    label: Text(AppLocalizations.of(context)!.removeAll),
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
                ? Center(
                    child: Text(AppLocalizations.of(context)!.empty,
                        style: const TextStyle(color: Colors.grey)),
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
          title: Text(AppLocalizations.of(context)!.setAmount),
          content: TextField(
            controller: controller,
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context)!.weightG),
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        );
      },
    );
  }
}
