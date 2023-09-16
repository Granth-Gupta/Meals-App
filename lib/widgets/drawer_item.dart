import 'package:flutter/material.dart';

import '/screens/category_meals_screen.dart';
import '/screens/filters_screen.dart';

class DrawerItem extends StatelessWidget {
  Widget buildListTile(
    String title,
    IconData icon,
    Function onPressed,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FilterScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
