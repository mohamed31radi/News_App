import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/providers/change_language_provider.dart';
import 'package:news_app/screens/setting_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) {
        var provider = Provider.of<LanguageProvider>(context);
        return MaterialApp(
          initialRoute: HomeLayout.routeName,
          routes: {
            HomeLayout.routeName: (context) => HomeLayout(),
            SettingScreen.routeName: (context) => SettingScreen(),
          },
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          locale: Locale(provider.language),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
