import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs["title"],
        ),
      ),
      body: Center(
        child: Text(
          "the receipes for the category",
        ),
      ),
    );
  }
}
