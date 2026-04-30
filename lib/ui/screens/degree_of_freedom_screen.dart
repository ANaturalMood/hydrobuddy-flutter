import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class DegreeOfFreedomScreen extends ConsumerWidget {
  const DegreeOfFreedomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDof = ref.watch(degreeOfFreedomProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Grau de Liberdade')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'O Grau de Liberdade (Degree of Freedom — DOF) permite que um '
              'nutriente varie livremente durante o cálculo de mínimos quadrados. '
              'Quando um elemento é escolhido como DOF, sua concentração final '
              'não é restrita ao valor alvo, sendo determinada pelas proporções '
              'das substâncias selecionadas.\n\n'
              'Na maioria dos casos, o Potássio (K) é a melhor escolha, pois '
              'nutrientes à base de K são abundantes e baratos.',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          RadioListTile<Element?>(
            title: const Text('Nenhum (sistema totalmente restrito)'),
            value: null,
            groupValue: selectedDof,
            onChanged: (v) =>
                ref.read(degreeOfFreedomProvider.notifier).set(v),
          ),
          ...Element.all.map(
            (e) => RadioListTile<Element?>(
              title: Text('${e.displayName} (${e.symbol})'),
              subtitle: e == Element.k ? const Text('Recomendado') : null,
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
