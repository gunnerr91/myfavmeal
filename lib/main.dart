import 'package:flutter/material.dart';
import 'package:myfavmeal/dummy_data.dart';
import 'package:myfavmeal/screens/categories_screen.dart';
import 'package:myfavmeal/screens/category_meals_screen.dart';
import 'package:myfavmeal/screens/filters_screen.dart';
import 'package:myfavmeal/screens/meal_detail_screen.dart';
import 'package:myfavmeal/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "lactoseFree": false,
    "glutenFree": false,
    "vegan": false,
    "vegeterian": false,
  };

  var _mealsToDisplay = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _mealsToDisplay = DUMMY_MEALS.where((meal) {
        if (_filters["glutenFree"] && !meal.isGlutenFree) {
          return false;
        } else if (_filters["lactoseFree"] && !meal.isLactoseFree) {
          return false;
        } else if (_filters["vegan"] && !meal.isVegan) {
          return false;
        } else if (_filters["vegeterian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealid) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealid);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals that made the deal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        "/": (_) => TabsScreen(favoriteMeals: _favoriteMeals),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(currentFilters: _filters, setFilters: _setFilters),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(meals: _mealsToDisplay),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavoriteHandler: _toggleFavorite,
            isMealFavorite: _isMealFavorite),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
