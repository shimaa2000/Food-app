import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters,this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  void initState(){
    _glutenFree = widget.filters['gluten'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    super.initState();
  }
  Widget buildSwitchListTile(String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue as Function(bool),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map <String,bool>selectedFilters={
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFilters(selectedFilters) ;
            },
            icon: Icon(Icons.save),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection ',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meal .', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meal .', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include vegan meal .', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meal .', _vegetarian,
                    (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
