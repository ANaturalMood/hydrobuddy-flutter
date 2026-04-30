import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hydrobuddy/domain/models/tank.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/tank_provider.dart';

class TankHistoryScreen extends ConsumerWidget {
  const TankHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tanksAsync = ref.watch(watchTankBatchesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.preparedTanks)),
      floatingActionButton: FloatingActionButton(
        heroTag: 'tank_fab',
        onPressed: () => context.push('/tank/prepare'),
        child: const Icon(Icons.add),
      ),
      body: tanksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (tanks) {
          if (tanks.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.water_drop_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(AppLocalizations.of(context)!.noTanksPrepared,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(AppLocalizations.of(context)!.tapPlusToCreate,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: tanks.length,
            itemBuilder: (context, index) => _TankTile(
              tank: tanks[index],
              key: ValueKey(tanks[index].id),
            ),
          );
        },
      ),
    );
  }
}

class _TankTile extends ConsumerStatefulWidget {
  final TankBatch tank;
  const _TankTile({required this.tank, super.key});

  @override
  ConsumerState<_TankTile> createState() => _TankTileState();
}

class _TankTileState extends ConsumerState<_TankTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final tank = widget.tank;
    final remaining = tank.volumeRemaining;
    final isActive = remaining > 0;
    final cs = Theme.of(context).colorScheme;
    final date =
        '${tank.preparedAt.day.toString().padLeft(2, '0')}/${tank.preparedAt.month.toString().padLeft(2, '0')} '
        '${tank.preparedAt.hour.toString().padLeft(2, '0')}:${tank.preparedAt.minute.toString().padLeft(2, '0')}';

    return Dismissible(
      key: ValueKey('dismiss_${tank.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: cs.error,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.deleteTank),
            content: Text(AppLocalizations.of(context)!.confirmDeleteTank(tank.name)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(AppLocalizations.of(context)!.delete),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) async {
        await ref.read(deleteTankBatchProvider(tank.id).future);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ExpansionTile(
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (expanded) =>
              setState(() => _isExpanded = expanded),
          title: Text(tank.name,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(AppLocalizations.of(context)!.remainingVolume(date, remaining.toStringAsFixed(0)),
              style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
          trailing: Chip(
            label: Text(isActive ? AppLocalizations.of(context)!.active : AppLocalizations.of(context)!.consumed,
                style: const TextStyle(fontSize: 10)),
            backgroundColor:
                isActive ? cs.primaryContainer : cs.surfaceContainerHighest,
            side: BorderSide.none,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          ),
          children: [
            _UsageEventsList(tankBatchId: tank.id),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.add, size: 18),
                    label: Text(AppLocalizations.of(context)!.registerIrrigation),
                    onPressed: () => _showIrrigationDialog(context),
                  ),
                  const SizedBox(width: 8),
                  if (isActive)
                    OutlinedButton.icon(
                      icon: const Icon(Icons.check, size: 18),
                      label: Text(AppLocalizations.of(context)!.finalize),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cs.tertiary,
                      ),
                      onPressed: () => _finalizeTank(context),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showIrrigationDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.registerIrrigation),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.volume,
            suffixText: 'L',
          ),
          keyboardType: TextInputType.number,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () {
              final volume = double.tryParse(controller.text);
              if (volume == null || volume <= 0) return;
              Navigator.pop(ctx);
              _recordIrrigation(volume);
            },
            child: Text(AppLocalizations.of(context)!.register),
          ),
        ],
      ),
    );
  }

  Future<void> _recordIrrigation(double volume) async {
    final tank = widget.tank;
    await ref.read(
      addUsageEventProvider(tank.id, 'irrigation', volume, null).future,
    );

    final newRemaining = tank.volumeRemaining - volume;
    final notifier = ref.read(tankBatchFormProvider.notifier);
    notifier.loadForEdit(tank);
    notifier.setVolumeRemaining(newRemaining > 0 ? newRemaining : 0);
    await notifier.save();
  }

  Future<void> _finalizeTank(BuildContext context) async {
    final tank = widget.tank;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.finalizeTank),
        content: Text(AppLocalizations.of(context)!.confirmFinalizeTank),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(AppLocalizations.of(context)!.finalize),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final notifier = ref.read(tankBatchFormProvider.notifier);
      notifier.loadForEdit(tank);
      notifier.setVolumeRemaining(0);
      await notifier.save();
    }
  }
}

class _UsageEventsList extends ConsumerWidget {
  final int tankBatchId;
  const _UsageEventsList({required this.tankBatchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(watchUsageEventsProvider(tankBatchId));

    return eventsAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (events) {
        if (events.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(AppLocalizations.of(context)!.noIrrigationRegistered,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Column(
            children: events.map((e) {
              final date =
                  '${e.createdAt.day.toString().padLeft(2, '0')}/${e.createdAt.month.toString().padLeft(2, '0')} '
                  '${e.createdAt.hour.toString().padLeft(2, '0')}:${e.createdAt.minute.toString().padLeft(2, '0')}';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.water_drop, size: 14, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '$date  ${e.eventType} ${e.volume.toStringAsFixed(0)}L',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
