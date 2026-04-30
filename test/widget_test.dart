import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/app.dart';

void main() {
  testWidgets('App renders with router', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: HydroBuddyApp()));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('HydroBuddy'), findsOneWidget);
  });
}
