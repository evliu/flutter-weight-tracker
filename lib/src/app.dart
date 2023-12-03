import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'services/authentication/auth_controller.dart';
import 'routes/login_view.dart';
import 'routes/weights_view.dart';
import 'services/store/store_controller.dart';

/// The Widget that configures the app.
class App extends StatelessWidget {
  const App({
    super.key,
    required this.authController,
    required this.storeController,
  });

  final AnonymousAuthController authController;
  final StoreController storeController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authController,
      builder: (BuildContext context, Widget? child) {
        return ListenableBuilder(
          listenable: storeController,
          builder: (BuildContext context, Widget? child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'weight_tracker.app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', '')],
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
            home: !authController.isLoggedIn()
                ? LoginView(login: authController.login)
                : WeightItemListView(
                    logout: authController.logout,
                    items: storeController.weightItems,
                    addWeightItem: (weight) => storeController.addWeightItem(
                      userId: authController.userId!,
                      weight: weight,
                    ),
                    updateWeightItem: storeController.updateWeightItem,
                    deleteWeightItem: storeController.deleteWeightItem,
                  ),
          ),
        );
      },
    );
  }
}
