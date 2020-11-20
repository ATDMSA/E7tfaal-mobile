import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/ApprovalSendingRequest.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'OffersPage.dart';

class SubscriptionStatus extends StatefulWidget {
  @override
  _SubscriptionStatusState createState() => _SubscriptionStatusState();
}

class _SubscriptionStatusState extends State<SubscriptionStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar

          CustomAppBar(
            onPressFilter: () => Navigator.pop(context),
            title: 'حالة الإشتراك',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.YellowColor, width: 4),
                          shape: BoxShape.circle),
                      child: Image(
                          image: AssetImage(
                              Resources.SpecialRoomsDetails_MARK))),

                  CircleAvatar(
                      backgroundColor: AppColors.YellowColor,
                      child: Icon(
                        Icons.check,
                        size: 40,
                        color: AppColors.whiteColor,
                      )),
                  // Image(image: AssetImage('assets/images/مميز.png'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'قاعة الأسطورة',
                style:
                TextStyle(fontSize: 22, color: AppColors.PurpleColor),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.GreyLightColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: AppColors.PurpleColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'حالة الطلب :',
                            style: Styles.loginTextStyle.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' تمت الموافقة ',
                                style: Styles.loginTextStyle.copyWith(
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.bold),
                                // here link
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginToRooms()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addressServices(
                            title: 'مدة الإشتراك', value: '356 يوم'),
                        addressServices(
                            title: 'اسم المدير ', value: 'منصور الأحمري'),
                        addressServices(
                            title: 'رقم الإشتراك', value: '25212421421'),
                        addressServices(
                            title: 'الدولة ',
                            value: 'المملكة العربية السعودية'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *.4,
                child: EduButton(
                  title: LocalKeys.NEXT,
                  onPressed: _next,
                  bgColor: AppColors.PurpleColor,
                  cornerRadius: 15,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.4,
                child: EduButton(
                  title: 'رجوع',
                   onPressed: _exit,
                  bgColor: AppColors.PurpleColor,
                  cornerRadius: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OffersPage()));
  }
  void _exit() {
    Navigator.pop(context);
  }
  void _messWelcome() {}
  Widget addressServices({String title, String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: AppColors.GreyColor),
            ),
          ),
          FittedBox(
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: AppColors.blackDarkColor),
            ),
          ),
          Divider(
            color: AppColors.GreyLightColor,
            height: 2,
            thickness: 1.1,
          )
        ],
      ),
    );
  }
}
