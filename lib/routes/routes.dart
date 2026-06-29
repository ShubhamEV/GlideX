import 'package:flutter/material.dart';

import '../screens/intro_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/recipe_details_screen.dart';
import '../screens/categories_details_screeen.dart';
import '../screens/lookup_data_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      IntroScreen.routeName: (_) => const IntroScreen(),
      AuthScreen.routeName: (_) => const AuthScreen(),
      HomeScreen.routeName: (_) => const HomeScreen(),
      RecipeDetailsScreen.routeName: (_) => const RecipeDetailsScreen(),
      CategoriesDetailsScreeen.routeName: (_) => const CategoriesDetailsScreeen(),
      LookupDataScreen.routeName: (_) => const LookupDataScreen(),
    };
  }
}
