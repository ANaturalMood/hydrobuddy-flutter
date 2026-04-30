import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class DegreeOfFreedomScreen extends ConsumerWidget {
  const DegreeOfFreedomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDof = ref.watch(degreeOfFreedomProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.degreeOfFreedom)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context)!.dofDescription,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          RadioListTile<Element?>(
            title: Text(AppLocalizations.of(context)!.noneFullyRestricted),
            value: null,
            groupValue: selectedDof,
            onChanged: (v) =>
                ref.read(degreeOfFreedomProvider.notifier).set(v),
          ),
          ...Element.all.map(
            (e) => RadioListTile<Element?>(
              title: Text('${e.displayName} (${e.symbol})'),
              subtitle: e == Element.k ? Text(AppLocalizations.of(context)!.recommended) : null,
              value: e,
              groupValue: selectedDof,
              onChanged: (v) =>
                  ref.read(degreeOfFreedomProvider.notifier).set(v),
            ),
          ),
        ],
      ),
    );
  }
}
