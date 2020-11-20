import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/ApprovalSendingRequest.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PayTheSubscriptionFees extends StatefulWidget {
  @override
  _PayTheSubscriptionFeesState createState() => _PayTheSubscriptionFeesState();
}

class _PayTheSubscriptionFeesState extends State<PayTheSubscriptionFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar
          CustomAppBar(
            onPressFilter:()=> Navigator.pop(context),
            title: 'سداد رسوم الإشتراك',
          ),
          Image(image: AssetImage('assets/images/شعار.png'),height: 120,),
          Form(
              child: Column(
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
                        // controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'رقم الإشتراك',
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
                        // controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'رقم الإشتراك',
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
                        // controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'رقم الإشتراك',
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
                        // controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'رقم الإشتراك',
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
                        // controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'رقم الإشتراك',
                          hintStyle: Styles.loginTextStyle
                              .copyWith(color: Colors.black),
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('صورة التحويل',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:AppColors.PurpleColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                              'assets/images/ic_backup.svg'
                          ),
                        ),
                      ],
                    ),
                  ),

                  EduButton(
                    style: Styles.loginTextStyle,
                    title: 'إرسال الطلب',
                    onPressed: _messWelcome,
                    bgColor: AppColors.PurpleColor,
                    cornerRadius: 10,
                  ),
                ],
              ))
        ],
      ),
    );
  }
  void _messWelcome() {

    showDialog(
      context: context,
      builder: (_) => ApprovalSendingRequest(),
    );
  }
}
