import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'authentication/auth_controller.dart';
import 'store/store_controller.dart';
import 'views/login_view.dart';
import 'weight/weight_item.dart';
import 'weight/weight_main_view.dart';

/// A [ListenableBuilder] that takes a list of [Listenable]s and builds a
/// widget tree with each [Listenable] as a parent of the previous one.
Widget buildWithListenable(
  List<Listenable> listenables,
  Widget Function(BuildContext) builder,
) {
  return Builder(
    builder: (BuildContext context) {
      Widget currentWidget = builder(context);

      for (var listenable in listenables.reversed) {
        currentWidget = ListenableBuilder(
          listenable: listenable,
          builder: (BuildContext context, Widget? child) => builder(context),
        );
      }

      return currentWidget;
    },
  );
}

/// The Widget that configures your application.
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
    return buildWithListenable(
      [authController, storeController],
      (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'jasper.weight.tracker.app',
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

        // Flutter web url navigation and deep linking.
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              if (!authController.isLoggedIn()) {
                return LoginView(authController: authController);
              }

              switch (routeSettings.name) {
                case WeightItemListView.routeName:
                default:
                  return WeightItemListView(
                    logout: authController.logout,
                    items: storeController.weightItems,
                    addWeightItem: (weight) {
                      if (authController.userId != null) {
                        storeController.addWeightItem(
                          WeightItem(
                            weight: weight,
                            dateTime: DateTime.now().toString(),
                            userId: authController.userId!,
                          ),
                        );
                      }
                    },
                    updateWeightItem: storeController.updateWeightItem,
                    deleteWeightItem: storeController.deleteWeightItem,
                  );
              }
            },
          );
        },
      ),
    );
  }
}
