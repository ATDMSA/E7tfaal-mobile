import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ForgetPasswordConfirmCode.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              /*gradient: new LinearGradient(
                     end: const Alignment(0.0, 0.3),
                     begin: const Alignment(0.0, 0.9),
                     colors: <Color>[
                       AppColors.PurpleColor,
                       AppColors.YellowColor,
                     ],
                   ),*/
              gradient: AppColors.customGradient,
              image: DecorationImage(
                  image: AssetImage(
                      Resources.FORGET_PASSWORD_BG_IMAGE
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

                CustomAppBar(
                  title: LocalKeys.REST_PASSWORD,
                ),


                SvgPicture.asset(
                    Resources.FORGET_PASSWORD_IMAGE
                ),

               Form(child: Column(
                 children: [
                   InkWell(
                       child: Text(
                         LocalKeys.ENTER_EMAIL,
                         style: TextStyle(
                             fontSize: 29,
                             color: AppColors.whiteColor,
                             decoration: TextDecoration.underline),
                       )),
                   SizedBox(
                     height: 10,
                   ),
                   /* Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text('البريد الإلكتروني'),
                          ),
                        ],
                      ),*/
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Container(
                       width: MediaQuery.of(context).size.width * 0.85,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black),
                           borderRadius: BorderRadius.circular(10)),
                       child: TextField(
                         controller: _email,
                         decoration: InputDecoration(
                           hintText: LocalKeys.EMAIL,
                           hintStyle: Styles.loginTextStyle
                               .copyWith(color: Colors.black),
                           border: InputBorder.none,
                           contentPadding:
                           EdgeInsets.symmetric(horizontal: 10),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   EduButton(
                     style: Styles.loginTextStyle,
                     title: LocalKeys.OK,
                     onPressed: _forgetPassword,
                     bgColor: AppColors.YellowColor,
                     cornerRadius: 15,
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

  void _forgetPassword() {
    if (_email.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.EMAIL_NOT_FOUND,
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ForgetPasswordConfirmCode()));
    }
  }
}
