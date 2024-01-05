import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My widget has a text "Spent" ', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(),
        ),
      ),
    );
    //create a finder to look for the word in home
    final spentFinder = find.text('Spent');
    //find one widget that contais the word
    expect(spentFinder, findsOneWidget);
  });
  testWidgets('Find a LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(),
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
    testWidgets('Find an AccountStatus', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(),
        ),
      ),
    );
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });
}
