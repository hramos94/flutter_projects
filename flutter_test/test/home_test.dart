import 'package:estilizacao_componentes/components/box_card.dart';
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

  testWidgets('Find 5 BoxCards', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(),
        ),
      ),
    );
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
  testWidgets('When tap deposit should upload earned in 10', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(),
        ),
      ),
    );
    //changing screen values
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));

    //updating or redrawing the screen
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });
}
