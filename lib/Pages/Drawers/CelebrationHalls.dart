import 'package:celebration/Pages/Auth/Drawers/Drawer.dart';
import 'package:flutter/material.dart';
class CelebrationHalls extends StatelessWidget {
  static const String routeName = '/halls';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Events")));
  }
}