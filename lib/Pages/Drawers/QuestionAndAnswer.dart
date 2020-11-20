import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
class QuestionAndAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CustomAppBar(
            title: 'تحدث مع إحتفال',
            onPressFilter:()=>  Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
