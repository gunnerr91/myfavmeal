import 'package:flutter/material.dart';
import 'package:myfavmeal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({@required this.currentFilters, @required this.setFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _lactoseFree = widget.currentFilters["glutenFree"];
    _glutenFree = widget.currentFilters["glutenFree"];
    _vegan = widget.currentFilters["glutenFree"];
    _vegeterian = widget.currentFilters["glutenFree"];
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function onChangehandler,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onChangehandler,
      subtitle: Text(subtitle),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "lactoseFree": _lactoseFree,
                  "glutenFree": _glutenFree,
                  "vegan": _vegan,
                  "vegeterian": _vegeterian,
                };
                widget.setFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  "Gluten free",
                  "Filter out gluten free?",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Lactose free",
                  "Filter out lactose free?",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegeterian",
                  "Filter out vegeterian dish?",
                  _vegeterian,
                  (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Filter out vegan free?",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
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
