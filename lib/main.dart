import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'provider/theme_switcher.dart';
import 'routes/initial_route.dart';
import 'config/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
  Future<void> _hideSystemTopBar() async {
    await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    await Future.delayed(Duration(minutes: 1), _hideSystemTopBar); //Loop
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeSwitcher(),
      child: Consumer<ThemeSwitcher>(
        builder: (context, ThemeSwitcher themeSwitcher, Widget child) {
          final darkTheme = AppTheme.darkTheme(context);
          final lightTheme = AppTheme.lightTheme(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Coddevs',
            theme: themeSwitcher.isDark? darkTheme : lightTheme,
            home: InitialRoute(),
          );
        },
      ),
    );
  }

  void initState() {
    _hideSystemTopBar();
    super.initState();
  }
}
