import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/Auth/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ForgetPasswordConfirmCode.dart';
class ChangeNewPassword extends StatefulWidget {
  @override
  _ChangeNewPasswordState createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  fit: BoxFit.fill),
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
                Text(
                  LocalKeys.ENTER_PASSWORD,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SvgPicture.asset(
                    Resources.FORGET_PASSWORD_NEW_PASSWORD_IMAGE
                ),

                SizedBox(
                  height: 20,
                ),
               Form(child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Container(
                       width: MediaQuery.of(context).size.width * 0.85,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black),
                           borderRadius: BorderRadius.circular(10)),
                       child: TextField(
                         controller: _password,
                         decoration: InputDecoration(
                           hintText: LocalKeys.ENTER_NEW_PASSWORD,
                           hintStyle:
                           Styles.loginTextStyle.copyWith(color: Colors.black),
                           border: InputBorder.none,
                           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                         ),
                       ),
                     ),
                   ),

                   SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Container(
                       width: MediaQuery.of(context).size.width * 0.85,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black),
                           borderRadius: BorderRadius.circular(10)),
                       child: TextField(
                         controller: _newPassword,
                         decoration: InputDecoration(
                           hintText: LocalKeys.ENTER_Return_PASSWORD,
                           hintStyle:
                           Styles.loginTextStyle.copyWith(color: Colors.black),
                           border: InputBorder.none,
                           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
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
    if(_password.text.isEmpty && _newPassword.text.isEmpty){
        showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.DATA_REQUERD,
        ),
      );
    } else if(_password.text.isEmpty){
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.PASSWORD_ERROR,
        ),
      );
    }else if(_newPassword.text.isEmpty){
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.NEW_PASSWORD_ERROR,
        ),
      );
    }else if(_password.text.isEmpty != _newPassword.text.isEmpty){
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.PASSWORD_NOT_SAME,
        ),
      );
    } else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage()));
    }
  }
}

