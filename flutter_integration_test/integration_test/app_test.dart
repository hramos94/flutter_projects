import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration tests', (tester) async {
    final providerKey = GlobalKey();
    app.main(list: [], providerKey: providerKey);
    await tester.pumpAndSettle();
    //testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
//testando o drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    //testando a nevegaçao
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();
    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    // testar a criaçao de um tipo de cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .name,
        'Ferro');
    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .icon,
        Icons.card_giftcard);

    // testando novo cliente

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gerenciar clientes'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('NameKey1')), 'Botzao');
    await tester.enterText(find.byKey(Key('EmailKey1')), 'Botzao@bot');

    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ferro').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    // verificando se o cliente apareceu corretamente

    expect(find.text('Botzao (Ferro)'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .name,
        'Botzao');
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .email,
        'Botzao@bot');
  });
}
