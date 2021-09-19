import 'package:base_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Complete app navigation flux', (WidgetTester tester) async {
    // Carrega o app
    await tester.pumpWidget(MyApp());

    // Procura o botao com texto goToHome
    final btnGoToHomePage = find.text('goToHome');
    expect(btnGoToHomePage, findsOneWidget);

    // Clica no botao para navegar para tela de Home
    await tester.tap(btnGoToHomePage);
    await tester.pumpAndSettle();

    // Procura o text Home no AppBar da page do micro de home
    final pageHomeTitle = find.text('Home');
    expect(pageHomeTitle, findsOneWidget);

    // Realiza o pop da page e retorna para page de login
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Procura o text Login no AppBar da page do micro de login
    final pageLoginTitle = find.text('Login');
    expect(pageLoginTitle, findsOneWidget);
  });
}
