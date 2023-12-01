import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'authentication/auth_controller.dart';

import 'views/login_view.dart';
import 'weight/weight_item_details_view.dart';
import 'weight/weight_item_list_view.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({super.key, required this.authController});

  final AnonymousAuthController authController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'jasper.weight.tracker.app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          //  localization/*.arb
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              color: Colors.blue[700],
              foregroundColor: Colors.white,
            ),
          ),

          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                if (!authController.isLoggedIn()) {
                  return LoginView(authController: authController);
                }

                switch (routeSettings.name) {
                  case WeightItemDetailsView.routeName:
                    return const WeightItemDetailsView();
                  case WeightItemListView.routeName:
                  default:
                    return WeightItemListView(authController: authController);
                }
              },
            );
          },
        );
      },
    );
  }
}
