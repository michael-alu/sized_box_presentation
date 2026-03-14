import 'package:flutter_test/flutter_test.dart';

import 'package:sized_box_presentation/main.dart';

void main() {
  testWidgets('SizedBox demo screen renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SizedBoxDemoApp());

    expect(find.text('SizedBox Widget Demo'), findsOneWidget);
    expect(find.text('1. width'), findsOneWidget);
    expect(find.text('2. height'), findsOneWidget);
    expect(find.text('3. SizedBox.expand'), findsOneWidget);
  });
}
