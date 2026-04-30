import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

/// Elementos com % > 0 formatados como string para subtitulo.
String _nonZeroElements(Substance s) {
  final parts = <String>[];
  for (final e in Element.all) {
    final v = s.getN(e);
    if (v > 0) {
      parts.add('${e.symbol}: ${v.toStringAsFixed(1)}%');
    }
  }
  return parts.join('  ');
}

/// Lista reutilizavel de substancias.
class SubstanceListView extends StatelessWidget {
  final List<Substance> substances;
  final void Function(Substance)? onTap;
  final void Function(Substance)? onDelete;

  const SubstanceListView({
    super.key,
    required this.substances,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (substances.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noSubstancesRegistered,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }
    return ListView.builder(
      itemCount: substances.length,
      itemBuilder: (context, index) {
        final substance = substances[index];
        return Dismissible(
          key: ValueKey(substance.id),
          direction:
              onDelete != null ? DismissDirection.endToStart : DismissDirection.none,
          confirmDismiss: (direction) async {
            return await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.confirmExclusion),
                content: Text(AppLocalizations.of(context)!.confirmRemoveSubstance(substance.name)),
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
          },
          onDismissed: (direction) => onDelete?.call(substance),
          background: Container(
            color: Theme.of(context).colorScheme.errorContainer,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
          ),
          child: ListTile(
            title: Text(substance.name),
            subtitle: Text([
              if (substance.formula != null && substance.formula!.isNotEmpty)
                substance.formula,
              _nonZeroElements(substance),
            ].where((s) => s != null && (s as String).isNotEmpty).join('  ')),
            trailing: onTap != null
                ? Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant)
                : null,
            onTap: onTap != null ? () => onTap!(substance) : null,
          ),
        );
      },
    );
  }
}
