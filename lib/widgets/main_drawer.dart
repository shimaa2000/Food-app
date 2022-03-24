import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTitle(String title,IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tapHandler as Function(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTitle('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTitle('Filters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
