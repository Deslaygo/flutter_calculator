import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/calculator_screen.dart';
import 'package:flutter_calculator/services/theme_service.dart';
import 'package:flutter_calculator/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final themeService = ThemeService();

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    themeService.darkTheme = await themeService.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeService),
      ],
      child: Consumer<ThemeService>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'Calculator',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(),
          darkTheme: AppTheme.darkThemeData(),
          themeMode: themeService.darkTheme ? ThemeMode.dark : ThemeMode.light,
          home: CalculatorScreen(),
        );
      }),
    );
  }
}
