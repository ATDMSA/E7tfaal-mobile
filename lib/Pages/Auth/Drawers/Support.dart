import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Auth/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomAppBar(

                title: 'تحدث مع إحتفال',
                onPressFilter:()=>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
              ),
            ],
          ),
        ));
  }
}