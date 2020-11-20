import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
import 'KeyBoardType.dart';


class ProfilePageTextFiled extends StatelessWidget {
  final String hint;
  final KeyBoard_Type keyBoardType;
  final TextEditingController controller;
  final bool keyboardEnabled;

  ProfilePageTextFiled({this.hint,this.keyBoardType, this.controller, this.keyboardEnabled = true});
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      enabled: keyboardEnabled,
      controller: controller,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: keyBoardType == KeyBoard_Type.text ?  TextInputType.text : TextInputType.phone,

      decoration: InputDecoration(

        errorStyle: TextStyle(
            fontSize: 16.0,

            color: AppColors.redColor
        ),

       hintText: hint,
      //  hintStyle: Styles.loginTextStyle.copyWith(color: Colors.black) ,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Theme.of(context)
                    .focusColor
                    .withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: AppColors.YellowColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: AppColors.YellowColor)),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: AppColors.redColor)),

      ),
    );
  }


}