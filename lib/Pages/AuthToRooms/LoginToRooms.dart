import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Pages/AuthToRooms/NewAccountRooms.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:celebration/Pages/Auth/ForgetPassword.dart';
import 'package:flutter/material.dart';
import 'package:celebration/Component/Widget/EduButton.dart';

class LoginToRooms extends StatefulWidget {
  @override
  _LoginToRoomsState createState() => _LoginToRoomsState();
}

class _LoginToRoomsState extends State<LoginToRooms> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage(
                  Resources.LOGIN_BG_IMAGE,
                ),
                fit: BoxFit.fill,
              )),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                        child:
                            Image(image: AssetImage(Resources.LOGIN_LOGO_IMAGE))),
                  ),
                  Form(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            style: Styles.loginTextStyle,
                            controller: _email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "البريد الإلكتروني",
                                hintStyle: Styles.loginTextStyle,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.whiteColor,
                                  size: 17,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            style: Styles.loginTextStyle,
                            controller: _password,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "كلمة المرور",
                                hintStyle: Styles.loginTextStyle,
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: AppColors.whiteColor, size: 17)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()));
                          },
                          child: Text(
                            'نسيت كلمة المرور ؟',
                            style: Styles.loginTextStyle,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      EduButton(
                        title: LocalKeys.LOGIN,
                        onPressed: _navigateToLogin,
                        bgColor: AppColors.PurpleColor,
                        cornerRadius: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EduButton(
                        title: LocalKeys.REGISTRATION,
                        onPressed: __navigateToSignUp,
                        bgColor: AppColors.GreyColor,
                        cornerRadius: 15,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _navigateToLogin() {
    if (_email.text.isEmpty && _password.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.DATA_REQUERD,
        ),
      );
    } else if (_email.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.EMAIL_NOT_FOUND,
        ),
      );
    } else if (_password.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.PASSWORD_ERROR,
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ControlBoard()));
    }
  }

  void __navigateToSignUp() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewAccountRooms(name: LocalKeys.NEW_ACCOUNT,)));
  }
}
