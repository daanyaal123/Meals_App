import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';
import 'package:meals_app/meals.dart';
import 'favourites_screen.dart';
import 'category_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int selectedindex = 0;

  @override
  void initState() {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites',
      },
    ];
    super.initState();
  }

  void selecttab(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectedindex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor: Colors.black,
        onTap: selecttab,
        //type: BottomNavigationBarType.shifting,
        //backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: "Favourites",
          )
        ],
      ),
    );
  }
}
