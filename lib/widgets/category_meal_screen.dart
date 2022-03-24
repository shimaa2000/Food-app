import 'package:flutter/material.dart';
import '../modules/meal.dart';
import './meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = 'category_meals';
  final List <Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle='';
  List<Meal> displayMeals=[];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArg =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'].toString();
    displayMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  void removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
