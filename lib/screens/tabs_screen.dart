import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/favorite_screen.dart';
import 'package:food_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favMeals;
  const TabsScreen( this._favMeals) ;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> _page=[];
  int _selectedPageIndex = 0;
  @override
  void initState() {
   _page = [
    {
    'page': CategoryScreen(),
    'title': 'Category',
    },
    {
    'page': FavoriteScreen(widget._favMeals),
    'title': 'Your Favorite',
    }
    ];
    super.initState();
  }
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title'].toString()),
        centerTitle: true,
      ),
      body: _page[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
