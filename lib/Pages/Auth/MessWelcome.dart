import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages//HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ForgetPasswordConfirmCode.dart';
class MessWelcome extends StatefulWidget {
  @override
  _MessWelcomeState createState() => _MessWelcomeState();
}

class _MessWelcomeState extends State<MessWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
              image: DecorationImage(
                  image: AssetImage(
                      Resources.FORGET_PASSWORD_BG3_IMAGE
                  ),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // appbar

                CustomAppBar(),

                SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                    Resources.NEW_ACCOUNT_MESS_WELCOME_IMAGE
                ),
                SizedBox(
                  height: 40,
                ),
                Form(child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    EduButton(
                      style: Styles.loginTextStyle,
                      title: LocalKeys.NEXT,
                      onPressed: _messWelcome,
                      bgColor: AppColors.PurpleColor,
                      cornerRadius: 40,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _messWelcome() {

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));

  }
}
