import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/domain/models/tank.dart';
import 'package:hydrobuddy/ui/providers/tank_provider.dart';
import 'package:hydrobuddy/ui/screens/tank_history_screen.dart';

TankBatch _testTank({int id = 1, String name = 'Tomate Semana 3', double remaining = 94}) {
  return TankBatch(
    id: id,
    name: name,
    formulationId: 1,
    volume: 100,
    volumeRemaining: remaining,
    preparedAt: DateTime(2025, 4, 28, 14, 32),
  );
}

TankUsageEvent _testEvent({int id = 1, int tankBatchId = 1, double volume = 2}) {
  return TankUsageEvent(
    id: id,
    tankBatchId: tankBatchId,
    eventType: 'irrigation',
    volume: volume,
    createdAt: DateTime(2025, 4, 28, 14, 35),
  );
}

Widget _wrap(List<Override> overrides) {
  final container = ProviderContainer(overrides: overrides);
  return UncontrolledProviderScope(
    container: container,
    child: const MaterialApp(
      home: TankHistoryScreen(),
    ),
  );
}

void main() {
  group('TankHistoryScreen', () {
    testWidgets('renders empty state when no tanks', (tester) async {
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => <TankBatch>[]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Tanques Preparados'), findsOneWidget);
      expect(find.text('Nenhum tanque preparado'), findsOneWidget);
    });

    testWidgets('renders tanks list', (tester) async {
      final tank = _testTank();
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => [tank]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Tomate Semana 3'), findsOneWidget);
      expect(find.byType(ExpansionTile), findsOneWidget);
    });

    testWidgets('expansion tile expands to show usage events', (tester) async {
      final tank = _testTank();
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => [tank]),
        watchUsageEventsProvider(tank.id).overrideWith((ref) async => [
              _testEvent(volume: 2),
              _testEvent(id: 2, volume: 3),
            ]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Registrar Rega'), findsNothing);

      await tester.tap(find.byType(ExpansionTile));
      await tester.pumpAndSettle();

      expect(find.text('Registrar Rega'), findsOneWidget);
      expect(find.text('Finalizar'), findsOneWidget);
    });

    testWidgets('collapsed by default', (tester) async {
      final tank = _testTank();
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => [tank]),
        watchUsageEventsProvider(tank.id).overrideWith((ref) async => [
              _testEvent(),
            ]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Registrar Rega'), findsNothing);
    });

    testWidgets('shows status chip based on remaining volume', (tester) async {
      final tank = _testTank();
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => [tank]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('ativo'), findsOneWidget);
      expect(find.text('consumido'), findsNothing);
    });

    testWidgets('shows consumed status when remaining is zero', (tester) async {
      final tank = _testTank(remaining: 0);
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => [tank]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('consumido'), findsOneWidget);
      expect(find.text('ativo'), findsNothing);
    });

    testWidgets('FAB is present', (tester) async {
      await tester.pumpWidget(_wrap([
        watchTankBatchesProvider.overrideWith((ref) async => <TankBatch>[]),
      ]));
      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
