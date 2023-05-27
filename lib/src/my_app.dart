import 'package:basic_bloc_code/app_cubit/app_cubit.dart';
import 'package:basic_bloc_code/app_locale/app_localizations.dart';
import 'package:basic_bloc_code/app_locale/locale_string/lang_key.dart';
import 'package:basic_bloc_code/app_routes/app_routes.dart';
import 'package:basic_bloc_code/src/extensions/space_extension.dart';
import 'package:basic_bloc_code/src/extensions/string_extension.dart';
import 'package:basic_bloc_code/src/ui/splash/splash_view.dart';
import 'package:basic_bloc_code/src/widgets/app_scaffold.dart';
import 'package:basic_bloc_code/utils/constants.dart';
import 'package:basic_bloc_code/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<LocalizationsDelegate> delegates = [];

  @override
  void initState() {
    delegates.clear();
    delegates.add(AppLocalizations.delegate);
    delegates.addAll(FlutterLocalization.instance.localizationsDelegates);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..init(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is AppNoInternet) {
            return MaterialApp(
              title: Constants.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: AppScaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.wifi_off_rounded,
                        size: 50,
                      ),
                      20.toSpace,
                      Text(LangKey.noInternet.tr(context))
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AppLoaded) {
            return MaterialApp(
              title: Constants.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routes: AppRoutes.routes,
              navigatorKey: NavigationService.instance.navigatorKey,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: delegates,
              localeResolutionCallback: (currentLocal, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (currentLocal?.languageCode == locale.languageCode) {
                    return currentLocal;
                  }
                }
                return supportedLocales.first;
              },
              locale: state.locale,
            );
          } else {
            return MaterialApp(
              title: Constants.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashView(),
            );
          }
        },
      ),
    );
  }
}
