import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/route/route_name.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'api/my_bloc_observer.dart';
import 'core/di/di.dart';
import 'core/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.getTheme,
      routes: {AppRoute.homeScreen: (context) => HomeScreen()},
    );
  }
}
