import 'package:flutter/material.dart';
import 'package:myfavmeal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "meal-details";

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${selectedmeal.title}",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: buildSectionTitle("Ingredients", context),
              ),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          selectedmeal.ingredients[index],
                        ),
                      ),
                    );
                  },
                  itemCount: selectedmeal.ingredients.length,
                ),
              ),
              buildSectionTitle("Steps", context),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          "${selectedmeal.steps[index]}",
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedmeal.steps.length,
                ),
              ),
            ],
          ),
        ));
  }
}
