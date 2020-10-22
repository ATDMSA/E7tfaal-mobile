
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Pages/Auth/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';

import 'ChangeNewPassword.dart';

class ForgetPasswordConfirmCode extends StatefulWidget {
  @override
  _ForgetPasswordConfirmCodeState createState() => _ForgetPasswordConfirmCodeState();
}

class _ForgetPasswordConfirmCodeState extends State<ForgetPasswordConfirmCode> {

  Timer _timer;
  int _start = 90;
  TextEditingController _email = TextEditingController();
  TextEditingController controller = TextEditingController(text: "");
  bool hasError = false;
  String code;
  bool showText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    showText = true;
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
          if (_start == 0) {
            setState(() {
              showText = false;
            });
          }
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // customGradient
              gradient: AppColors.customGradient,
            ),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // appbar

                CustomAppBar(
                  title: LocalKeys.REST_PASSWORD,
                ),
                Center(
                  child: Text(
                    LocalKeys.ENTER_CODE_OF_EMAIL,
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SvgPicture.asset(
                    Resources.FORGET_PASSWORD_CONFIRM_IMAGE
                ),

               Form(child: Column(
                 children: [
                   SizedBox(
                     height: 10,
                   ),
                   Container(
                     padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                         color: AppColors.whiteColor,
                         borderRadius: BorderRadius.circular(20)
                     ),
                     child: Column(
                       children: [
                         PinCodeTextField(
                           pinBoxHeight: 50,
                           pinBoxWidth: 30,
                           controller: controller,
                           highlight: true,
                           defaultBorderColor: AppColors.GreyColor,
                           hasTextBorderColor: AppColors.PurpleDarkColor,
                           errorBorderColor: Colors.red,
                           maxLength: 4,
                           hasError: hasError,
                           onTextChanged: (text) =>
                               setState(() => hasError = false),
                           onDone: (text) {
                             print("DONE CONTROLLER ${controller.text}");
                             setState(() => code = controller.text);
                           },
                           wrapAlignment: WrapAlignment.center,
                           pinBoxDecoration: ProvidedPinBoxDecoration
                               .underlinedPinBoxDecoration,
                           pinTextStyle: TextStyle(fontSize: 30.0),
                           pinTextAnimatedSwitcherTransition:
                           ProvidedPinBoxTextAnimation.scalingTransition,
                           pinTextAnimatedSwitcherDuration:
                           Duration(milliseconds: 300),
                           highlightAnimationBeginColor: Colors.black,
                           highlightAnimationEndColor: Colors.white12,
                           keyboardType: TextInputType.number,
                         ),
                         SizedBox(height: 15,),
                         EduButton(
                             style: Styles.loginTextStyle.copyWith(fontSize: 15),
                             title: LocalKeys.CONFIRM,
                             bgColor: AppColors.PurpleColor,
                             cornerRadius: 25,
                             onPressed: () => verifyFunction()),
                         SizedBox(height: 10,),
                         Text(LocalKeys.CONFIRMATION_CODE,style: TextStyle(color: Color(0xff057815),fontSize: 13,),),
                       ],
                     ),
                   ),
                   SizedBox(height: 15,),
                   //Text('يمكنك إعادة إرسال الرمز بعد مرور: 1:30',style: Styles.loginTextStyle.copyWith(fontSize: 15)),
                   Visibility(
                       visible: showText,
                       child: FittedBox(
                         child: Text(
                             "يمكنك إعادة إرسال الرمز بعد مرور 00 : " + _start.toString(),
                             style: Styles.loginTextStyle.copyWith(fontSize: 15)
                         ),
                       )),

                 ],
               ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  verifyFunction() {
    if (controller.text.isEmpty || controller.text.length < 4) {
      setState(() => hasError = true);
    } else {
      setState(() => hasError = false);
      // displayCustomCircular(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangeNewPassword()));
    }
  }

}
