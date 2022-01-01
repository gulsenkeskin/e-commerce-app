import 'package:e_commerce_app/colors.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/login.dart';
import 'package:flutter/material.dart';

final ThemeData _kShrineTheme=_buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base= ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    )
  );
}



class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: const HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != "/login") {
      return null;
    }
    return MaterialPageRoute(
      builder: (BuildContext context) => const LoginPage(),
      settings: settings,
      fullscreenDialog: true,
    );
  }
}
