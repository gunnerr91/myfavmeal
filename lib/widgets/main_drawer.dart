import 'package:flutter/material.dart';
import 'package:myfavmeal/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String header, IconData iconData, String routeName) {
      return ListTile(
        leading: Icon(
          iconData,
          size: 26,
        ),
        title: Text(
          header,
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(routeName);
        },
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColorLight),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant, "/"),
          buildListTile("Filters", Icons.settings, FiltersScreen.routeName),
        ],
      ),
    );
  }
}
