import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildSwitchTiles(
    String title,
    String subtitle,
    bool currentval,
    Function updatevalue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentval,
      subtitle: Text(subtitle),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters!",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenfree,
                'vegeterian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactosefree,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Adjust Your Meals Here!",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTiles(
                  "Gluten-Free",
                  "Only includes Gluten-Free Meals",
                  _glutenfree,
                  (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                  },
                ),
                _buildSwitchTiles(
                  "Vegeterian",
                  "Only includes Vegeterain Meals",
                  _vegetarian,
                  (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                ),
                _buildSwitchTiles(
                  "Vergan",
                  "Only includes Vegan Meals",
                  _vegan,
                  (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                ),
                _buildSwitchTiles(
                  "Lactose-Free",
                  "Only includes Lactose-Free Meals",
                  _lactosefree,
                  (newvalue) {
                    setState(() {
                      _lactosefree = newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
