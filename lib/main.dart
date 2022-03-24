import 'package:flutter/material.dart';
import './dummy_data.dart';
import './modules/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './widgets/category_meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _toggleFavorite(String mealId){
   final existingIndex= _favMeals.indexWhere((meal) =>meal.id==mealId);
   if(existingIndex>=0){
     setState(() {
       _favMeals.removeAt(existingIndex);
     });
   }else{
     setState(() {
       _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
     });
   }
  }
  bool isMealFavorite(String id){
    return _favMeals.any((meal) => meal.id==id);
  }
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Color.fromRGBO(220, 129, 102, 0.9019607843137255),
          canvasColor: Color.fromRGBO(253, 236, 248, 0.9019607843137255),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Colors.black38,
                ),
                body2: TextStyle(
                  color: Colors.white70,
                ),
                title: TextStyle(
                    color: Colors.black38,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      routes: {
        '/': (context) => TabsScreen(_favMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
        centerTitle: true,
      ),
    );
  }
}
