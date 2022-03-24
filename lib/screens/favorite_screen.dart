import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../modules/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favMeals;
  FavoriteScreen(this._favMeals);

  @override
  Widget build(BuildContext context) {
    if(_favMeals.isEmpty)
    return Center(
      child: Text(
        'You have no favorite yet - Start adding some !',
        style: TextStyle(color: Colors.black),
      ),
    );
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favMeals[index].id,
            imageUrl: _favMeals[index].imageUrl,
            title: _favMeals[index].title,
            duration: _favMeals[index].duration,
            complexity: _favMeals[index].complexity,
            affordability: _favMeals[index].affordability,
          );
        },
        itemCount: _favMeals.length,
      );
    }
  }
}
