import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/app.dart';

void main() {
  testWidgets('App renders home placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(const HydroBuddyApp());
    expect(find.text('HydroBuddy'), findsOneWidget);
  });
}
