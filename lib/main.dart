import 'package:flutter/material.dart';

import 'screens/intro_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/recipe_details_screen.dart';
import 'screens/categories_details_screeen.dart';
import 'screens/lookup_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (_) => const IntroScreen(),
        AuthScreen.routeName: (_) => const AuthScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        RecipeDetailsScreen.routeName: (_) => const RecipeDetailsScreen(),
        CategoriesDetailsScreeen.routeName: (_) => const CategoriesDetailsScreeen(),
        LookupDataScreen.routeName: (_) => const LookupDataScreen(),
      },
    );
  }
}
